package Test::Returns;

use strict;
use warnings;

use Exporter 'import';
use Test::Builder;
use Return::Set qw(set_return);
use Scalar::Util qw(blessed);

our @EXPORT  = qw(returns_ok returns_not_ok returns_is returns_isnt);
our $VERSION = '0.01';

my $Test = Test::Builder->new();

=head1 NAME

Test::Returns - Test::Builder-based validation of Return::Set behavior

=head1 SYNOPSIS

    use Test::More;
    use Test::Returns;

    returns_ok(42, { type => 'integer' }, 'Returns valid integer');
    returns_ok([], { type => 'arrayref' }, 'Returns valid arrayref');
    returns_ok("bad", { type => 'arrayref' }, 'Fails (expected arrayref)');

=head1 DESCRIPTION

Exports the function C<returns_ok>, which asserts that a value satisfies a
schema using L<Return::Set>. Integrates with Test::Builder for use alongside
Test::More and friends.

=head1	METHODS

=head2 returns_is($value, $schema, $test_name)

Passes if C<$value> satisfies C<$schema> using C<Return::Set>. Fails otherwise.

=cut

sub returns_is {
	my ($value, $schema, $test_name) = @_;

	my $ok;
	my $error;

	eval {
		$ok = set_return($value, $schema) eq $value;
		1;
	} or do {
		$error = $@;
		$ok = 0;
	};

	if ($ok) {
		$Test->ok(1, $test_name);
	} else {
		$Test->ok(0, $test_name);
		$Test->diag("Validation failed: $error");
	}

	return $ok;
}

=head2	returns_isnt

Opposite of returns_is

=cut

sub returns_isnt
{
	my ($value, $schema, $test_name) = @_;

	my $ok;
	my $error;

	eval {
		$ok = set_return($value, $schema) ne $value;
		1;
	} or do {
		$error = $@;
		$ok = 0;
	};

	if ($ok) {
		$Test->ok(0, $test_name);
	} else {
		$Test->ok(1, $test_name);
	}

	return $ok;
}

=head2	returns_ok

Synonym of returns_is

=cut

sub returns_ok
{
	return returns_is(@_);
}

=head2	returns_not_ok

Synonym of returns_isnt

=cut

sub returns_not_ok
{
	return returns_isnt(@_);
}

=head1 AUTHOR

Nigel Horne <njh at nigelhorne.com>

=head1 SUPPORT

This module is provided as-is without any warranty.

=head1 LICENCE AND COPYRIGHT

Copyright 2025 Nigel Horne.

Usage is subject to licence terms.

The licence terms of this software are as follows:

=over 4

=item * Personal single user, single computer use: GPL2

=item * All other users (including Commercial, Charity, Educational, Government)
  must apply in writing for a licence for use from Nigel Horne at the
  above e-mail.

=back

=cut

1;
