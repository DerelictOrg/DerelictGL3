DerelictGL3
===========

A dynamic binding to OpenGL for the D Programming Language.

lease see the pages [Building and Linking Derelict][1] in the Derelict documentation, for information on how to build DerelictGL3 tDerelictGL3 differs from the other Derelict packages in that there is a two-step load process which is used to mask some platform differences in how the graphics drivers are managed. Everything on the page [Using Derelict][2] in the Derelict documentation still applies. The difference is that <tt>DerelictGL3.load()</tt>, unlike its behavior in the other bindings, does not load the entire library; it only loads the functions for OpenGL versions 1.0 and 1.1. Once a context has been created, <tt>DerelictGL3.reload()</tt> should be called. This will load all available versions 1.2+ and all supported ARB and EXT extensions. <tt>reload</tt> should also be called any time the OpenGL context is switched. The <tt>load</tt> method can be called before or after creating a context, but should always be called before <tt>reload</tt> and does not need to be called on a context switch.

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

To make use of the deprecated OpenGL API, the same steps can be followed, but using the DerelictGL loader instead of DerelictGL3. Note that you do not need to import <tt>derelict.opengl3.gl3</tt> when using the DerelictGL loader. The <tt>derelict.opengl3.gl</tt> module publicly imports all of the non-deprecated functions and types as well as the deprecated ones.
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

Valid values for <tt>GLVersion</tt> can be found in the module [derelict.opengl3.types][3].

[1]: http://derelictorg.github.io/compiling.html
[2]: http://derelictorg.github.io/using.html
[3]: https://github.com/DerelictOrg/DerelictGL3/blob/master/source/derelict/opengl3/types.d#L89
