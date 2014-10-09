build.lean.js
=============

This is a project to aid porting [Lean](http://leanprover.github.io/)
code to Javascript using an amazing tool called
[Emscripten](https://github.com/kripken/emscripten)

It includes an Emscripten build for [GMP](http://gmplib.org/),
[MPFR](http://www.mpfr.org/), and [LUA](http://lua.org) (dependencies
of Lean), which may be of use in their own right.

This repository is based on [cgaljs](https://github.com/marcosscriven/cgaljs).


Required Packages
-----------------

[Emscripten](https://github.com/kripken/emscripten)
```bash
sudo apt-get update
sudo apt-get install build-essential cmake python2.7 nodejs default-jre git wget m4
sudo apt-get install nodejs-legacy    # If the executable of node.js is `nodejs` instead of `node`
wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
tar xvf emsdk-portable.tar.gz
cd emsdk_portable
./emsdk update
./emsdk install latest
./emsdk activate latest
```

To get started
--------------

```bash
git clone https://github.com/soonhokong/build.lean.js
cd build.lean.js
make
```

You should find the generated libraries in the `libs` dir, and includes for each dependency in the `includes` dir.


Issues & Limitations
--------------------

 *
