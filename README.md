# NAME

Test::Returns - Test::Builder-based validation of Return::Set behavior

# SYNOPSIS

    use Test::More;
    use Test::Returns;

    returns_ok(42, { type => 'integer' }, 'Returns valid integer');
    returns_ok([], { type => 'arrayref' }, 'Returns valid arrayref');
    returns_ok("bad", { type => 'arrayref' }, 'Fails (expected arrayref)');

# DESCRIPTION

Exports the function `returns_ok`, which asserts that a value satisfies a
schema using [Return::Set](https://metacpan.org/pod/Return%3A%3ASet). Integrates with Test::Builder for use alongside
Test::More and friends.

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

# LICENSE

Same terms as [Return::Set](https://metacpan.org/pod/Return%3A%3ASet).
