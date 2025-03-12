package Mo::utils::Unicode;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Mo::utils 0.06 qw(check_array);
use Readonly;
use Unicode::UCD 'charblocks';

Readonly::Array our @EXPORT_OK => qw(check_array_unicode_block check_unicode_block);

our $VERSION = 0.01;

sub check_array_unicode_block {
	my ($self, $key) = @_;

	if (! exists $self->{$key}) {
		return;
	}

	check_array($self, $key);

	foreach my $unicode_block (@{$self->{$key}}) {
		_check_unicode_block($unicode_block, $key);
	}

	return;
}

sub check_unicode_block {
	my ($self, $key) = @_;

	if (! exists $self->{$key}) {
		return;
	}

	_check_unicode_block($self->{$key}, $key);

	return;
}

sub _check_unicode_block {
	my ($value, $key) = @_;

	if (none { $value eq $_ } keys %{charblocks()}) {
		err "Parameter '".$key."' doesn't contain valid Unicode block.",
			'Value', $value,
		;
	}

	return;
}

1;
