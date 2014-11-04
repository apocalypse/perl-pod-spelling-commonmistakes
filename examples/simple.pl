#!/usr/bin/perl

use Test::More;

BEGIN {
	eval { require Pod::Spelling };
	if ($@){
		plan skip_all => 'requires Pod::Spelling' ;
	}
}

# First, we test without allow_words
ok((-e 'test.pod'), 'Got file');
my $o = Pod::Spelling->new( 'import_speller' => 'Pod::Spelling::CommonMistakes' );
my @r = $o->check_file( 'test.pod' );

is( @r, 0, 'Expected errors' );

done_testing();
