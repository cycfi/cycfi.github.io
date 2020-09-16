---
title: API
---
## ![Q-Logo](/assets/img/q/q-logo-small.png) Audio DSP Library

## File Structure

The library is organized with this simplified directory structure:

* docs
* example
* q_io
   * external
   * include
   * src
* q_lib
   * include
* test

`docs` is where this documentation resides. `example` contains self-contained
and easy to understand c++ files that demonstrate various features of the
library. `q_io` is the Audio and MIDI I/O layer which contains `external`
—3rd party libraries used by the `q_io` module, `include` —Header files and
`src` —Source files. `q_lib` is the header-only core DSP library in the
`include` sub-directory. Finally, the `test` directory contains a bunch of
c++ files for testing the library.

## Namespace

All entities in the Q library are placed in namespace `cycfi::q`. Everywhere
in this documentation, we will be using a namespace alias to make the code
less verbose:

```c++
   namespace q = cycfi::q;
```

## Functors

In the world of electronic music, there are *processors* and *synthesizers*,
the definitions of which are somewhat overlapping and differ only on one
specific point: that processors take in one or more input value(s) and
produces one or more output value(s), whereas a synthesizer does not take in
any inputs at all.

In the Q world, both *processors* and *synthesizers* are just *functors* —C++
function objects, which are basic building blocks that can be composed to
form more complex functions. A functor can have zero or more input values and
produces one or more output values (typically just one, but in certain cases,
two or more output values may be returned in the form of C++ tuples).

Syntactically, you use these just like any other function. So, for instance,
for a single input functor:

```c++
   float r = f(s);
```
where `s` is the input value, and `f(s)` returns a result and stores it in
the variable `r`. Typical audio processor *functors* in the Q DSP library
work on 32-bit `float` input samples with the normal -1.0 to 1.0 range.

## Values

Values are not restricted to sampled signals, however. For an example, signal
envelopes are best represented in the decibel domain, and so dynamic-range
processors such as compressors and expanders take `decibel` as inputs and
return `decibel` results. For example:

```c++
   decibel gain = comp(env);
```

Another example, oscillators work on phase-angle inputs and return output
samples:

```c++
   float out = sin(phase++);
```

The Q DSP library has a rich set of such types:

* `float`: Typical sample data type -1.0 to 1.0 (or beyond for some
  computational headroom).
* `frequency`: Cycles per second (Hz).
* `duration` : A time span (seconds, milliseconds, etc.)
* `period` : The inverse of frequency
* `phase`: Fixed point 1.31 format where 31 bits are fractional. `phase`
  represents 0 to 2π phase values suitable for oscillators.
* `decibel`: Ratio of one value to another on a logarithmic scale (dB)

The Q DSP library is typeful and typesafe. You can not mismatch values of
different types such as `frequency` and `decibel`, for example. Such
potentially disastrous mistakes can happen if all values are just raw
floating point types.

Values do not have implicit conversion to raw types, however, except for
`decibel`, which is special because it operates on the logarithmic domain,
comparison and arithmetic with raw types are possible. For example:

```c++
   auto harmonic = 440_Hz * 4; // 440_Hz is a frequency literal (see below)
```

## Values API

See the [Values API page](values.md) for the complete API.

## Literals

To augment the wealth of value types, the Q DSP library makes abundant use of
[C++ user-defined
literals](https://en.cppreference.com/w/cpp/language/user_literal). Here are
some examples:

```c++
   auto c4 = 261.6256_Hz;
   auto threshold = -36_dB;
   auto coef = 1.0 - (2_pi * 1_kHz / sps);
   auto attack = 20_ms;
```

To use these literals, include the `literals.hpp` header:

```c++
   #include <q/support/literals.hpp>
```

then use the `literals` namespace somewhere in a scope where you need it:

```c++
   using namespace q::literals;
```

Here's the list of available literals:

```c++
   // frequency
   constexpr frequency operator ""  _Hz(long double val);
   constexpr frequency operator ""  _Hz(unsigned long long int val);
   constexpr frequency operator ""  _KHz(long double val);
   constexpr frequency operator ""  _KHz(unsigned long long int val);
   constexpr frequency operator ""  _kHz(long double val);
   constexpr frequency operator ""  _kHz(unsigned long long int val);
   constexpr frequency operator ""  _MHz(long double val);
   constexpr frequency operator ""  _MHz(unsigned long long int val);

   // duration
   constexpr duration operator ""   _s(long double val);
   constexpr duration operator ""   _s(unsigned long long int val);
   constexpr duration operator ""   _ms(long double val);
   constexpr duration operator ""   _ms(unsigned long long int val);
   constexpr duration operator ""   _us(long double val);
   constexpr duration operator ""   _us(unsigned long long int val);

   // decibel
   constexpr decibel operator ""    _dB(unsigned long long int val);
   constexpr decibel operator ""    _dB(long double val);

   // pi
   constexpr long double operator "" _pi(long double val);
   constexpr long double operator "" _pi(unsigned long long int val)
```

## Notes

There is also a complete set of tables for notes from A[0] (27.5Hz) to Ab[9]
(13289.75Hz). For example, to get the frequencies for each of the open
strings in a 6-string guitar:

```c++
   // 6 string guitar frequencies:
   constexpr auto low_e   = E[2];
   constexpr auto a       = A[2];
   constexpr auto d       = D[3];
   constexpr auto g       = G[3];
   constexpr auto b       = B[3];
   constexpr auto high_e  = E[4];
```

To use these literals, include the `notes.hpp` header:

```c++
   #include <q/support/notes.hpp>
```

then use the `notes` namespace somewhere in a scope where you need it:

```c++
   using namespace q::notes;
```
