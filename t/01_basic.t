use strict;
use Test::More;
use Plack::Test;
use HTTP::Request::Common;

{
    package PrimalNephia::TestApp::LTSV;
    use PrimalNephia plugins => ['Response::LTSV'];
    path '/' => sub {
        ltsv_res [
            {
                age => 32,
                name => {
                    handle => 'ytnobody',
                    real => 'Satoshi Azuma',
                },
            },
            {
                age => 27,
                name => {
                    handle => 'tonkichi',
                    real => 'Tonkichi Higashi',
                },
            },
        ];
    };
};

subtest 'normal' => sub {
    my $app = PrimalNephia::TestApp::LTSV->app;
    test_psgi $app, sub {
        my $cb = shift;
        my $res = $cb->(GET '/');
        my $content = do {local $/; <DATA>};
        chomp $content;
        is $res->header('Content-Type'), 'text/x-ltsv; charset=UTF-8', 'content-type';
        is $res->content, $content, 'content';
    };
    
};

done_testing;
__DATA__
name.handle:ytnobody	name.real:Satoshi Azuma	age:32
name.handle:tonkichi	name.real:Tonkichi Higashi	age:27
