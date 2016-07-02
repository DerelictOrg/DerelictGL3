module derelict.opengl.arb.internal;

package:
string makeGShared(string funcs) { return "__gshared{" ~ funcs ~ "}"; }

string makeLoader(string name, string impl, string glVersion)
{
    return `struct ` ~ name ~
`
{
    static this()
    {
        import derelict.opengl.extloader : registerExtensionLoader;
        registerExtensionLoader("` ~ name ~ `", &load, GLVersion.` ~ glVersion ~`);
    }
    static bool load(void delegate(void**,string) bindGLFunc, bool doThrow)
    {
        try {`
            ~ impl ~
`       } catch(Exception e) {
            if(doThrow) throw e;
            else return false;
        }
        return true;
    }
}`;
}