use v6.c;
use Crypt::CAST5;
use Test;

plan 4;

throws-like {
	Crypt::CAST5.new: ''
}, X::AdHoc;

throws-like {
	Crypt::CAST5.new: 'this key is way too long'
}, X::AdHoc;

{
	my Str          $key      = 'ayy lmao';
	my Crypt::CAST5 $cast5   .= new: $key;
	my Str          $in       = 'ayy lmao';
	my Blob         $encoded  = $cast5.encode: $in.encode;
	my Blob         $decoded  = $cast5.decode: $encoded;
	cmp-ok $in, 'eq', $decoded.decode, 'Can encrypt and decrypt strings using a key with fewer than 10 characters';
}

{
	my Str          $key      = 'ayy lmaooooooooo';
	my Crypt::CAST5 $cast5   .= new: $key;
	my Str          $in       = 'ayy lmao';
	my Blob         $encoded  = $cast5.encode: $in.encode;
	my Blob         $decoded  = $cast5.decode: $encoded;
	cmp-ok $in, 'eq', $decoded.decode, 'Can encrypt and decrypt strings using a key with greater than 10 characters';
}
