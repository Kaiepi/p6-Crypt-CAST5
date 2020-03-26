use v6.d;
use NativeCall;
unit class Crypt::CAST5:ver<0.1.1>:auth<github:Kaiepi> is repr('CPointer');

sub LIB(--> Str) { state $ = %?RESOURCES<libraries/cast5>.absolute }

sub cast5_init(Blob, size_t --> Crypt::CAST5)    is native(LIB) {*}
sub cast5_encode(Crypt::CAST5, Blob, Blob is rw) is native(LIB) {*}
sub cast5_decode(Crypt::CAST5, Blob, Blob is rw) is native(LIB) {*}
sub cast5_free(Crypt::CAST5)                     is native(LIB) {*}

method new(Blob $key!) {
    die 'The CAST5 key must be between 5 and 16 characters long.' if $key.elems < 5 || $key.elems > 16;
    cast5_init($key, $key.elems)
}

method encode(Blob $plaintext --> Blob) {
    Blob.new: $plaintext.rotor(8, :partial).map({
        my Blob $in  .= new: $_;;
        my Blob $out .= allocate: 8;
        cast5_encode(self, $in, $out);
        $out.contents
    }).flat[0..^$plaintext.elems]
}

method decode(Blob $ciphertext --> Blob) {
    Blob.new: $ciphertext.rotor(8, :partial).map({
        my Blob $in  .= new: $_;;
        my Blob $out .= allocate: 8;
        cast5_decode(self, $in, $out);
        $out.contents
    }).flat[0..^$ciphertext.elems]
}

submethod DESTROY() { cast5_free(self) }
