use strict;
use warnings;

use Test::Most;
use Test::Returns;

returns_is(5, { type => 'integer' }, 'Integer ok');
returns_ok([], { type => 'arrayref' }, 'Arrayref ok');
returns_ok({ foo => 1 }, { type => 'hashref' }, 'Hashref ok');
returns_isnt("nope", { type => 'hashref' }, 'Fails: not a hashref');

done_testing();
