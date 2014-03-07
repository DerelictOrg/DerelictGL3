module derelict.opengl3.internal.funcmix;

private import derelict.opengl3.internal.functions;

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
}