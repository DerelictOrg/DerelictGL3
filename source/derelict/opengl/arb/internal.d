module derelict.opengl.arb.internal;

package:
string makeGShared(string funcs) { return "__gshared{" ~ funcs ~ "}"; }

string makeLoader(string name, string impl, string glversion)
{
    return `struct ` ~ name ~
`
{
    static this()
    {
        import derelict.opengl.extloader : registerExtensionLoader;
        registerExtensionLoader("` ~ name ~ `", &load);
    }
    static bool load(GLVersion loadedVersion, void delegate(void**,string) bindGLFunc)
    {
        try {`
            ~ impl ~
`       } catch(Exception e) {
            if(loadedVersion >= GLVersion.` ~ glversion ~ `) throw e;
            else return false;
        }
        return true;
    }
}`;
}