module derelict.opengl3.internal.globalctx;

public {
    import derelict.opengl3.internal.arbconstants;
    import derelict.opengl3.internal.coreconstants;
    import derelict.opengl3.internal.extconstants;
    import derelict.opengl3.internal.types;
}

private {
    import derelict.opengl3.internal.arbfunctions;
    import derelict.opengl3.internal.corefunctions;
    import derelict.opengl3.internal.extfunctions;

    import derelict.util.system;
}

static if( Derelict_OS_Windows ) {
    public import derelict.opengl3.internal.wglconstants;
    private import derelict.opengl3.internal.wglfunctions;
} else static if( Derelict_OS_Mac ) {
    public import derelict.opengl3.internal.cglconstants;
    private import derelict.opengl3.internal.cglfunctions;
} else static if( Derelict_OS_Posix ) {
    public import derelict.opengl3.internal.glxconstants;
    private import derelict.opengl3.internal.glxfunctions;
}

enum EXTEnabled = true;

__gshared {

    mixin( GL11Funcs );
    mixin( GL12Funcs );
    mixin( GL13Funcs );
    mixin( GL14Funcs );
    mixin( GL15Funcs );
    mixin( GL20Funcs );
    mixin( GL21Funcs );
    mixin( GL30Funcs );
    mixin( GL31Funcs );
    mixin( GL32Funcs );
    mixin( GL33Funcs );
    mixin( GL40Funcs );

    mixin( ARBProps );
    mixin( ARBFuncs );

    mixin( EXTProps );
    mixin( EXTFuncs );

    static if( Derelict_OS_Windows ) {
        mixin( WGLFuncs );
        mixin( WGLEXTProps );
        mixin( WGLEXTFuncs );
    } else static if( Derelict_OS_Mac ) {
        mixin( CGLFuncs );
    } else static if( Derelict_OS_Posix ) {
        mixin( GLXFuncs );
        mixin( GLXEXTProps );
        mixin( GLXEXTFuncs );
    }
}