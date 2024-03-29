use strict;
use warnings;

use Mock::Person::EN qw(middle_female);
use List::Util 1.33 qw(any);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $ret1 = middle_female();
like($ret1, qr{^\w+$}, 'Middle female must be one word.');

# Test.
my @middle_females = @Mock::Person::EN::middle_female;
my $ret2 = any { $ret1 eq $_ } @middle_females;
is($ret2, 1, 'Middle female is from middle female names list.');
