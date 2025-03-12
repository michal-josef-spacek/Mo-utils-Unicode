package Mo::utils::Unicode;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Readonly;
use Unicode::UCD 'charblocks';

Readonly::Array our @EXPORT_OK => qw(check_unicode_block);

our $VERSION = 0.01;

sub check_unicode_block {
	my ($self, $key) = @_;

	if (! exists $self->{$key}) {
		return;
	}

	if (none { $self->{$key} eq $_ } keys %{charblocks()}) {
		err "Parameter '".$key."' doesn't contain value Unicode block.";
	}

	return;
}

1;
