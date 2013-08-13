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
Aaron
Adam
Aidan
Alex
Alfie
Andrew
Anthony
Ashley
Ben
Bradley
Brandon
Callum
Calum
Cameron
Charlie
Chris
Connor
Conor
Craig
Curtis
Dan
Daniel
Danny
Darren
David
Declan
Dylan
Edward
Elliot
Ethan
George
Harrison
Harry
Henry
Jack
Jacob
Jake
James
Jamie
Jason
Jay
Joe
JOHN
Jonathan
Jordan
Joseph
Josh
Joshua
Kane
Kieran
Kyle
Lee
Leon
Lewis
Liam
Louis
Luke
Marcus
Mark
Martin
Matt
Matthew
Max
Michael
Mike
Morgan
Nathan
Oli
Oliver
Ollie
Owen
Patrick
Paul
Peter
Philip
Reece
Rhys
Richard
Robbie
Robert
Ross
Ryan
Sam
Samuel
Scott
Sean
Sebastian
Shaun
Simon
Stephen
Steve
Steven
Stuart
Taylor
Thomas
Tom
Tyler
Utku
Will
William
);

# First nad middle female names.
our @first_female = our @middle_female = qw(
Abbie
Abi
Aimee
Alex
Alice
Amber
Amelia
Amy
Anna
Annie
Ashleigh
Becca
Becky
Beth
Bethan
Bethany
Caitlin
Chantelle
Charley
Charlie
Charlotte
Chelsea
Chloe
Claire
Courtney
Daisy
Ddanielle
Eleanor
Elizabeth
Ella
Ellie
Emily
Emma
Erin
Francesca
Freya
Gemma
Georgia
Georgina
Grace
Hannah
Hayley
Heather
Helen
Holly
Jade
Jasmine
Jennifer
Jenny
Jess
Jessica
Jodie
Kate
Katherine
Katie
Katy
Kayleigh
Kelly
Kirsty
Laura
Leah
Leanne
Lily
Lisa
Louise
Lucy
Luren
Lydia
Megan
Melissa
Mia
Millie
Mollie
Molly
Naomi
Natalie
NATASHA
Niamh
Nicola
Nicole
Olivia
Paige
Phoebe
Rachael
Rachel
Rebecca
Rhiannon
Robyn
Rose
Rosie
Samantha
Sara
Sarah
Sasha
Shannon
Sophie
Stacey
Stephanie
Victoria
Zoe
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

L<surnames.behindthename.com|http://surnames.behindthename.com/names/usage/english>

=item B<Middle names>

There's usually no distinction between a first and middle name in England.

=item B<First names>

Woman: L<jmenaprijmeni.cz|http://www.jmenaprijmeni.cz/anglicka-jmena-zeny>
Man: L<jmenaprijmeni.cz|http://www.jmenaprijmeni.cz/anglicka-jmena-muzi>

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
