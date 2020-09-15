---
title: Backends
---
Currently, [Skia] and [Quartz-2D] are supported. Historically, the Artist
library was the 2D vector graphics component for the [Elements Library],
implemented using the [Cairo 2D graphics library] as the sole backend. After
many years waiting for Cairo to support path effects, needed for modern GUI
applications, it is apparent that Cairo development has gone stale with the
latest entry stating "cairo 1.16 (2017?)". See [Cairo Roadmap]. It is probably
forthcoming that Cairo support in the Elements library will be dropped
and will not be ported to the Artist library
(Although there is an initial port if someone is interested).

Before Cairo, the precursor of the Artist library used [NanoVG].
It was then that the basic design principles took shape.
Like Artist, the NanoVG API is modeled after HTML5 canvas API.
NanoVG was dropped early on due to lack of support from its author,
[poor text rendering quality] and inferior rendering quality (in general)
compared to my gold standard: Quartz-2D.
Currently, the NanoVG project is not actively maintained.

It was a good decision to isolate the NanoVG backend with a clean-cut C++
canvas API. NanoVG had a C interface to begin with, so it was a necessary
step. But isolating it in a well-defined API also meant that it could be
replaced any time. If, on the other hand, I hard-coded application code to
use NanoVG directly, I would have been locked to that specific library.
Abstraction is the key. Libraries come and go. The king of the hill now, may
be superseded by another "better" library in the future. Case in point:
Cairo.

There is also a half-baked [Direct-2D] port on windows, currently shelved.
It is working, except for the text layout part which has its own text-layout engine.
Direct-2D is such a pain to work with compared to other graphics libraries and
for lack of time, for now, it is indefinitely shelved
(Again, I welcome it if anyone wants to continue where I stopped).

A few graphics libraries have splendid support for text-layout. Some don't,
in particular, Skia. For Skia, I am using the [Harfbuzz] library for text-layout.

[Cairo 2D graphics library]:   https://www.cairographics.org/
[Cairo Roadmap]:               https://www.cairographics.org/roadmap/
[Direct-2D]:                   https://docs.microsoft.com/en-us/windows/win32/direct2d/direct2d-portal
[Elements Library]:            https://cycfi.github.io/elements/
[HarfBuzz]:                    https://www.freedesktop.org/wiki/Software/HarfBuzz/
[NanoVG]:                      https://github.com/memononen/nanovg
[Quartz-2D]:                   https://apple.co/2SljYHw
[Skia]:                        https://skia.org/
[poor text rendering quality]: https://blog.johnnovak.net/2016/05/29/cross-platform-gui-trainwreck-2016-edition/#enter-nanovg
