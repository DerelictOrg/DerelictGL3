DerelictGL3
===========

A dynamic binding to OpenGL for the D Programming Language.

For information on how to build DerelictGL3 and link it with your programs, please see the post [Building and Using Packages in DerelictOrg](http://dblog.aldacron.net/forum/index.php?topic=841.0) at the Derelict forums.

DerelictGL3 differs from the other Derelict packages in that there is a two-step load process which is used to mask some platform differences in how the graphics drivers are managed. Everything on the page [DerelictUtil for Users](https://github.com/DerelictOrg/DerelictUtil/wiki/DerelictUtil-for-Users) at the DerelictUtil Wiki still applies. The difference is that <tt>DerelictGL3.load()</tt>, unlike its behavior in the other bindings, does not load the entire library. It only loads the functions for OpenGL versions 1.0 and 1.1. Once a context has been created, <tt>DerelictGL3.reload()</tt> should be called. This will load all available versions 1.2+ and all supported ARB and EXT extensions. <tt>reload</tt> should also be called any time the OpenGL context is switched. The <tt>load</tt> method can be called before or after creating a context, but should always be called before <tt>reload</tt> and does not need to be called on a context switch.

Using the DerelictGL3 loader will only load core OpenGL functions and will not load any of the deprecated API. Here's some sample code.

```D
// For core API functions.
import derelict.opengl3.gl3;

void main() {
    // Load OpenGL versions 1.0 and 1.1.
    DerelictGL3.load();

    // Create an OpenGL context with another library (like SDL 2 or GLFW 3)
    ...

    // Load versions 1.2+ and all supported ARB and EXT extensions.
    DerelictGL3.reload();

    // Now OpenGL functions can be called.
    ...
}
```

To make use of the deprecated OpenGL API, the same steps can be followed, but using the DerelictGL loader instead of DerelictGL3.
```D
// For core *and* deprecated API functions.
import derelict.opengl3.gl;

void main() {
    // Load OpenGL versions 1.0 and 1.1.
    DerelictGL.load();

    // Create an OpenGL context with another library (like SDL 2 or GLFW 3)
    ...

    // Load versions 1.2+ and all supported ARB and EXT extensions.
    DerelictGL.reload();

    // Now OpenGL functions can be called.
    ...
}
```

In both cases, the <tt>reload</tt> method will attempt to load the highest OpenGL version supported by the active context. It will return a value of the type <tt>GLVersion</tt> indicating which version was actually loaded. This can also be queried at any time via the <tt>loadedVersion</tt> property of both loaders.

Valid values for <tt>GLVersion</tt> can be found in the module [derelict.opengl3.types](https://github.com/DerelictOrg/DerelictGL3/blob/master/source/derelict/opengl3/types.d#L89).

