[![Actions Status](https://github.com/JJ/p6-pod-load/actions/workflows/linux.yml/badge.svg)](https://github.com/JJ/p6-pod-load/actions) [![Actions Status](https://github.com/JJ/p6-pod-load/actions/workflows/macos.yml/badge.svg)](https://github.com/JJ/p6-pod-load/actions) [![Actions Status](https://github.com/JJ/p6-pod-load/actions/workflows/windows.yml/badge.svg)](https://github.com/JJ/p6-pod-load/actions)

NAME
====



**Pod::Load** - Loads and compiles the Rakudoc documentation of an external file or a string

**Note**: This module's name was chosen before Perl 6 was renamed to Raku and Pod (or Pod6) was renamed to Rakudoc. Most internal references were renamed accordingly, but the module's original name will be retained. Note also that, as of this release, Raku cannot handle '=begin/= rakudoc' document delimiters.

SYNOPSIS
========



    use Pod::Load;
    use X::Pod::Load::SourceErrors;

    # Read a file handle.
    my $rakudoc = load("file-with.rakudoc".IO);
    say $rakudoc.raku; # Process it as a Rakudoc

    # Or simply use the file name
    my @rakudoc = load("file-with.rakudoc");
    say .raku for @rakudoc;

    # Or a string
    @rakudoc = load("=begin pod\nThis could be a comment with C<code>\n=end pod");

    # Or ditch the scaffolding and use the string directly:
    @rakudoc = load-pod("This could be a comment with C<code>");

    # If there's an error, it will throw X::Pod::Load::SourceErrors

DESCRIPTION
===========



Pod::Load is a module with a simple task: obtain the documentation of an external file in a standard, straightforward way.

Its mechanism was originally inspired by [`Pod::To::BigPage`](https://github.com/perl6/perl6-pod-to-bigpage), from where the code to use the cache was taken.

### multi sub load

```raku
multi sub load(
    Str $string
) returns Mu
```

Loads a string, returns a Rakudoc object (`$=pod`).

### multi sub load

```raku
multi sub load(
    Str $file where { ... }
) returns Mu
```

If it's an actual filename, loads a file and returns the Rakudoc object.

### multi sub load

```raku
multi sub load(
    IO::Path $io
) returns Mu
```

Loads an IO::Path, returns a Rakudoc object.

### sub load-pod

```raku
sub load-pod(
    Str $string-with-rakudoc
) returns Mu
```

Loads a string with Rakudoc, returns a Rakudoc object.

INSTALL
-------

Do the usual:

```raku
zef install .
```

to install this if you've made any modification.

AUTHOR
======



JJ Merelo <jjmerelo@gmail.com>, with help from [Richard Hainsworth](https://github.com/finanalyst)

COPYRIGHT AND LICENSE
=====================

Copyright 2018-2025 JJ Merelo

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

