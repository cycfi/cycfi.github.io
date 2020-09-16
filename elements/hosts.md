---
title: Hosts
---
In order to work in various systems, elements comes with different hosts
options, each of which is set with the `ELEMENTS_HOST_UI_LIBRARY` macro in the
build system setup.
Currently the available hosts are:

- `cocoa`:        used natively on macOS
- `gtk`:          used as default choice on Linux
- `win32`:        used natively on Windows
- `experimental`: used for testing / development stages

While `cocoa` and `win32` are used natively on the related platforms, `gtk` can
be set also in more environments, for example using [MinGW].

`experimental` is used only on edge cases to permit developers to use Elements
in a new host development, and for this reason the use of it on production code
is not supported.

[MinGW]: setup#windows-mingw--gtk
