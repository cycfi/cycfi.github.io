---
title: Home
show_page_title: false
---
# Elements C++ GUI library

![Photon Sampler Image](/assets/img/elements/photon_sampler.jpg)

## Introduction

Elements is a lightweight, fine-grained, resolution independent,
modular GUI library. Elements is designed with these requirements in mind:

1. It should be open source with a liberal, non-viral license.
2. It should be usable in any application and should play well with other GUI
   libraries and frameworks.
3. Corollary to the second requirement is that it can also be used to develop
   plugins. It should not own the event loop and should be able to co-exist
   with components within a plugin host such as VST and AU.
4. It should be resolution independent and allow for HDPI displays.
5. Should not rely on a “visual” GUI editor or code generator.
6. It should have a declarative API using modern C++. Declarative C++ code
   tells you *what* rather than *how* (imperative). The GUI should be
   declared in C++ code.

Elements, is extremely lightweight… and modular. You compose very
fine-grained, flyweight “elements” to form deep element hierarchies using a
declarative interface with heavy emphasis on reuse.

## Documentation

1. [Gallery](gallery)
2. [Setup and Installation](setup)
3. [Design Aspects](aspects)
4. [Layout](layout)

The Elements C++ GUI library is cross-platform. Elements currently supports
the MacOS, Windows and Linux. Follow the [Setup and Installation
guide](setup) to get started using the
library.
