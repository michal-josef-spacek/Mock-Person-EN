# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Generate random sets of English names.';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'Mock-Person-EN';
readme_from 'EN.pm';
requires 'Exporter' => 0;
requires 'List::MoreUtils' => 0;
requires 'Readonly' => 0;
requires 'perl' => '5.8.0';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=Mock-Person-EN';
resources 'homepage' => 'https://github.com/tupinek/Mock-Person-EN';
resources 'repository' => 'git://github.com/tupinek/Mock-Person-EN';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.05;
test_requires 'List::MoreUtils' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.03';

# Run.
WriteAll();
