module derelict.opengl3.internal.globalctx;

private {
    import derelict.opengl3.internal.arbfunctions;
    import derelict.opengl3.internal.extfunctions;
    import derelict.opengl3.internal.functions;
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
}