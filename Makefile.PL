use inc::Module::Install;

name('DateTime-Format-RSS');
all_from("lib/DateTime/Format/RSS.pm");

requires 'DateTime::Format::Mail';
requires 'DateTime::Format::ISO8601';
requires 'DateTime::Format::DateParse';

auto_install;
WriteAll;

