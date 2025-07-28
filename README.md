# NAME

Test::Returns - Test::Builder-based validation of Return::Set behavior

# SYNOPSIS

    use Test::More;
    use Test::Returns;

    returns_ok(42, { type => 'integer' }, 'Returns valid integer');
    returns_ok([], { type => 'arrayref' }, 'Returns valid arrayref');
    returns_not_ok("bad", { type => 'arrayref' }, 'Fails (expected arrayref)');

# DESCRIPTION

Exports the function `returns_ok`, which asserts that a value satisfies a schema using [Return::Set](https://metacpan.org/pod/Return%3A%3ASet).
Integrates with [Test::Builder](https://metacpan.org/pod/Test%3A%3ABuilder) for use alongside [Test::Most](https://metacpan.org/pod/Test%3A%3AMost) and friends.

# METHODS

## returns\_is($value, $schema, $test\_name)

Passes if `$value` satisfies `$schema` using `Return::Set`. Fails otherwise.

## returns\_isnt

Opposite of returns\_is

## returns\_ok

Synonym of returns\_is

## returns\_not\_ok

Synonym of returns\_isnt

# AUTHOR

Nigel Horne &lt;njh at nigelhorne.com>

# SEE ALSO

[Test::Builder](https://metacpan.org/pod/Test%3A%3ABuilder)

# SUPPORT

This module is provided as-is without any warranty.

# LICENCE AND COPYRIGHT

Copyright 2025 Nigel Horne.

Usage is subject to licence terms.

The licence terms of this software are as follows:

- Personal single user, single computer use: GPL2
- All other users (including Commercial, Charity, Educational, Government)
  must apply in writing for a licence for use from Nigel Horne at the
  above e-mail.
