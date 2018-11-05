[![Build Status](https://travis-ci.org/Kaiepi/p6-Crypt-CAST5.svg?branch=master)](https://travis-ci.org/Kaiepi/p6-Crypt-CAST5)

NAME
====

Crypt::CAST5 - CAST-128 encryption library

SYNOPSIS
========

    use Crypt::CAST5;

    my Crypt::CAST5 $cast5   .= new: 'ayy lmao';
    my Str          $in       = 'ayy lmao';
    my Blob         $encoded  = $cast5.encode: $in.encode;
    my Blob         $decoded  = $cast5.decode: $encoded;
    my Str          $out      = $decoded.decode;
    say $out; # ayy lmao

DESCRIPTION
===========

Crypt::CAST5 is a library that handles encryption and decryption using the CAST-128 algorithm.

METHODS
=======

  * **new**(Str *$key* --> Blob)

Constructs a new instance of Crypt::CAST5 using the given key. The key must be 5-16 characters long.

  * **encode**(Blob *$in* --> Blob)

Encodes `$in` using CAST-128 encryption and returns the result.

  * **decode**(Blob *$in* --> Blob)

Decodes `$in` using CAST-128 encryption and returns the result.

AUTHOR
======

Ben Davies (Kaiepi)

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Ben Davies

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

