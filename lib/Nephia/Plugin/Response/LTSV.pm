package Nephia::Plugin::Response::LTSV;
use 5.008005;
use strict;
use warnings;

our $VERSION = "0.01";

use Text::LTSV;
use Hash::Flatten ();

our @EXPORT = qw/ltsv_res/;

sub ltsv_res ($) {
    my $value = shift;
    my $content = ref($value) eq 'HASH' ? Text::LTSV->new(%{Hash::Flatten::flatten($value)})->to_s :
                  ref($value) eq 'ARRAY' ? join( "\n", map { Text::LTSV->new(%{Hash::Flatten::flatten($_)})->to_s } @$value) :
                  undef
    ;
    return [
        200, ['Content-Type' => 'text/x-ltsv; charset=UTF-8'], [ $content ]
    ];
}

1;
__END__

=encoding utf-8

=head1 NAME

Nephia::Plugin::Response::LTSV - A plugin for Nephia that give LTSV responding feature

=head1 SYNOPSIS

    package YourApp;
    use Nephia plugins => ['Response::LTSV'];
    path '/' => sub {
        return ltsv_res [
            +{ name => 'ytnobody', age => '32' },
            +{ name => 'tonkichi', age => '27' },
            ...
        ];
    };

=head1 DESCRIPTION

Labeled Tab-separated Values (LTSV) format is a variant of Tab-separated Values (TSV). 

Nephia::Plugin::Response::LTSV gives responding feature with in LTSV format.

=head1 EXPORTS

=head2 ltsv_res $HASHREF_OR_ARRAYREF

Returns PSGI-response that contains LTSV formatted contents.

=head1 LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

ytnobody E<lt>ytnobody@gmail.comE<gt>

=head1 SEE ALSO

L<Text::LTSV>

L<Hash::Flatten>

L<http://ltsv.org/>

=cut

