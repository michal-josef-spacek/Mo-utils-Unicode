use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Mo::utils::Unicode qw(check_unicode_block);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $self = {
	'key' => 'Latin Extended-A',
};
my $ret = check_unicode_block($self, 'key');
is($ret, undef, 'Right Unicode block is present (Latin Extended-A).');

# Test.
$self = {};
$ret = check_unicode_block($self, 'key');
is($ret, undef, 'No Unicode block is present.');

# Test.
$self = {
	'key' => 'bad',
};
eval {
	check_unicode_block($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' doesn't contain valid Unicode block.\n",
	"Parameter 'key' doesn't contain valid Unicode block (bad).");
clean();
