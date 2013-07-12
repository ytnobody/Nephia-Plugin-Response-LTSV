# NAME

Nephia::Plugin::Response::LTSV - A plugin for Nephia that give LTSV responding feature

# SYNOPSIS

    package YourApp;
    use Nephia plugins => ['Response::LTSV'];
    path '/' => sub {
        return ltsv_res [
            +{ name => 'ytnobody', age => '32' },
            +{ name => 'tonkichi', age => '27' },
            ...
        ];
    };

# DESCRIPTION

Labeled Tab-separated Values (LTSV) format is a variant of Tab-separated Values (TSV). 

Nephia::Plugin::Response::LTSV gives responding feature with in LTSV format.

# EXPORTS

## ltsv\_res $HASHREF\_OR\_ARRAYREF

Returns PSGI-response that contains LTSV formatted contents.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>

# SEE ALSO

[Text::LTSV](http://search.cpan.org/perldoc?Text::LTSV)

[Hash::Flatten](http://search.cpan.org/perldoc?Hash::Flatten)

[http://ltsv.org/](http://ltsv.org/)
