package Mock::Person::EN;

# Pragmas.
use base qw(Exporter);
use strict;
use utf8;
use warnings;

# Modules.
use List::MoreUtils qw(none);
use Readonly;

# Constants.
Readonly::Scalar our $SPACE => q{ };
Readonly::Array our @EXPORT_OK => qw(first_male first_female middle_female
	last_male last_female middle_male middle_female name name_male
	name_female);

# Variables.
our $TYPE = 'three';

# Version.
our $VERSION = 0.01;

# First and middle male names.
our @first_male = our @middle_male = qw(
);

# First nad middle female names.
our @first_female = our @middle_female = qw(
);

# Last names.
our @last_male = our @last_female = qw(
);

# Get random first male name.
sub first_male {
	return $first_male[rand @first_male];
}

# Get random first female name.
sub first_female {
	return $first_female[rand @first_female];
}

# Get random last male name.
sub last_male {
	return $last_male[rand @last_male];
}

# Get random last female name.
sub last_female {
	return $last_female[rand @last_female];
}

# Get random middle male name.
sub middle_male {
	return $middle_male[rand @middle_male];
}

# Get random middle female name.
sub middle_female {
	return $middle_female[rand @middle_female];
}

# Get random name.
sub name {
	my $sex = shift;
	if (! defined $sex || none { $sex eq $_ } qw(female male)) {
		if ((int(rand(2)) + 1 ) % 2 == 0) {
			return name_male();
		} else {
			return name_female();
		}
	} elsif ($sex eq 'female') {
		return name_female();
	} elsif ($sex eq 'male') {
		return name_male();
	}
}

# Get random male name.
sub name_male {
	if (defined $TYPE && $TYPE eq 'three') {
		my $first_male = first_male();
		my $middle_male = middle_male();
		while ($first_male eq $middle_male) {
			$middle_male = middle_male();
		}
		return $first_male.$SPACE.$middle_male.$SPACE.last_male();
	} else {
		return first_male().$SPACE.last_male();
	}
}

# Get random female name.
sub name_female {
	if (defined $TYPE && $TYPE eq 'three') {
		my $first_female = first_female();
		my $middle_female = middle_female();
		while ($first_female eq $middle_female) {
			$middle_female = middle_female();
		}
		return $first_female.$SPACE.$middle_female.$SPACE.last_female();
	} else {
		return first_female().$SPACE.last_female();
	}
}

1;

__END__

=encoding UTF-8

=cut

=head1 NAME

Mock::Person::EN - Generate random sets of English names.

=head1 SYNOPSIS

 use Mock::Person::EN qw(first_male first_female last_male last_female
         middle_male middle_female name);
 my $first_male = first_male();
 my $first_female = first_female();
 my $last_male = last_male();
 my $last_female = last_female();
 my $middle_male = middle_male();
 my $middle_female = middle_female();
 my $name = name($sex);

=head1 DESCRIPTION

Data for this module was found on these pages:

=over

=item B<Last names>

TODO
L<about.com|http://german.about.com/od/names/a/German-Surnames.htm>

=item B<Middle names>

There's usually no distinction between a first and middle name in England.

=item B<First names>

TODO
L<indiachildnames.com|http://www.indiachildnames.com/top100/germannames.html>

=back

=head1 SUBROUTINES

=over 8

=item B<first_male()>

Returns random first name of male person.

=item B<first_female()>

Returns random first name of female person.

=item B<last_male()>

Returns random last name of male person.

=item B<last_female()>

Returns random last name of female person.

=item B<middle_male()>

Returns random middle name of male person.

=item B<middle_female()>

Returns random middle name of female person.

=item B<name([$sex])>

Recieves scalar with sex of the person ('male' or 'female') and returns
scalar with generated name.
Default value of $sex variable is undef, that means random name.

=item B<name_male()>

Returns random male name.

=item B<name_female()>

Returns random female name.

=back

=head1 VARIABLES

=over 8

=item B<TYPE>

 Name type.
 Possible values are: 'two', 'three'.
 Default value is 'three'.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(encode_utf8);
 use Mock::Person::EN qw(name);

 # Error.
 print encode_utf8(name())."\n";

 # Output like.
 # TODO

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Encode qw(encode_utf8);
 use Mock::Person::EN;

 # Get all last male names.
 my @last_males = @Mock::Person::EN::last_male;

 # Print out.
 print sort map { encode_utf8($_)."\n" } @last_males;

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Exporter>,
L<List::MoreUtils>,
L<Readonly>.

=head1 SEE ALSO

L<Mock::Person>,
L<Mock::Person::CZ>,
L<Mock::Person::DE>,
L<Mock::Person::SK>,
L<Mock::Person::SV>,
L<Mock::Person::RU>.

=head1 REPOSITORY

L<https://github.com/tupinek/Mock-Person-EN>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.01

=cut
