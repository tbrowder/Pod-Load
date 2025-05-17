#!/usr/bin/env raku

for (3, 1..3, "m" ) -> $m {
    .say with $m.?bounds()
}

=output
(1 3)
