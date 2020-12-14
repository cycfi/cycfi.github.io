---
title: FAQ
---
## Missing submodules

Unfortunately GitHub doesn't include the required git submodules available in
the repository in their zip / tar.gz packages, so you need to download the
related source manually separately. This leads to the same error below also
if you haven't cloned the repository with the `--recursive` / `recurse-submodules`
switch, resulting with the error:
```
CMake Error at lib/CMakeLists.txt:NNN (add_subdirectory):
  The source directory
    path/to/gitsubmodule
  does not contain a CMakeLists.txt file.
-- Configuring incomplete, errors occurred!
```
run `git submodule update --init --recursive` from the project directory.
