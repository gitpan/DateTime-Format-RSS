use strict;
use Module::Build;

my $class = Module::Build->subclass(code => <<'EOSUB');
    sub ACTION_disttest
    {
        my $self = shift;
        local $ENV{PERL_TESTPOD} = 1;
        $self->SUPER::ACTION_disttest(@_);
    }

    sub find_test_files
    {
        my $self  = shift;
        my $tests = $self->SUPER::find_test_files(@_);

        return $tests if $ENV{PERL_TESTPOD};
        return [ grep { $_ !~ /\bpod.*\.t\z/ } @$tests ];
    }
EOSUB

my $build = $class->new(
    dist_version_from => 'lib/DateTime/Format/RSS.pm',
    dist_name => 'DateTime-Format-RSS',
    requires => {
        'DateTime::Format::ISO8601'   => 0,
        'DateTime::Format::Mail'      => 0,
        'DateTime::Format::DateParse' => 0,
    },
    license => 'perl',
    create_readme => 1,
    create_makefile_pl => 'traditional',
);

$build->create_build_script();