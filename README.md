DerelictGL3
===========

A dynamic binding to OpenGL for the D Programming Language.

Please see the sections on [Compiling and Linking][1] in the Derelict documentation for information on how to build DerelictGL3. DerelictGL3 differs from the other Derelict packages in that there is a two-step load process which is used to mask some platform differences in how the graphics drivers are managed. Everything in the section [The Derelict Loader][2] in the Derelict documentation still applies. The difference is that `DerelictGL3.load()`, unlike its behavior in the other bindings, does not load the entire library; it only loads the functions for OpenGL versions 1.0 and 1.1. Once a context has been created, `DerelictGL3.reload()` should be called. This will load all available versions 1.2+ and all supported ARB and EXT extensions. `reload` should also be called any time the OpenGL context is switched. The `load` method can be called before or after creating a context, but should always be called before the first call to `reload` and does not need to be called on a context switch.

By default, the DerelictGL3 loader will only load core OpenGL functions and will not load any of the deprecated API or extensions. Here's some sample code.

```D
// For core API functions.
import derelict.opengl;

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

DerelictGL3 supports a compile-time configurable API. It can be used to restrict compiled OpenGL symbols to a specific version. For example, the above snippet compiles all supported core OpenGL symbols up to version 4.5 into the binary and the loader will attempt to load them all, but with the compile-time configuration options can be restricted to OpenGL 2.1, or 3.3, or any other supported version. It is also the only way to make deprecated symbols and extensions available. See the [DerelictGL3 documentation][3] for details.

[1]: http://derelictorg.github.io/building/overview/
[2]: http://derelictorg.github.io/loading/loader/
[3]: http://derelictorg.github.io/packages/gl3/
