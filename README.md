lean.js
=======

LIVE DEMO: https://leanprover.github.com/live

This is a project to aid porting [Lean](http://leanprover.github.io/)
code to Javascript using an amazing tool called
[Emscripten](https://github.com/kripken/emscripten). It includes an
Emscripten build for [GMP](http://gmplib.org/),
[MPFR](http://www.mpfr.org/), and [LUA](http://lua.org) (dependencies
of Lean), which may be of use in their own right. This repository is
based on [cgaljs](https://github.com/marcosscriven/cgaljs).

You can link it from your HTML code:

```html
<script src="https://leanprover.github.io/lean.js/lean.js" type="text/javascript" charset="utf-8"></script>
```
