module derelict.opengl.extensions.internal;

package:
string makeGShared(string funcs) { return "__gshared{" ~ funcs ~ "}"; }

version(DerelictGL3_Contexts)
string makeLoader(string name, string impl, string glVersion)
{
    return
    `if(contextVersion >= GLVersion.` ~ glVersion ~ `|| isExtensionSupported("` ~ name ~ `")) {
        try {`
            ~ impl ~
            `setExtensionState("` ~ name ~ `", true);
        } catch(Exception e) {
            if(contextVersion < GLVersion.`~ glVersion ~ `)
                setExtensionState("` ~ name ~ `", false);
            else throw e;
        }
    }`;
}
else
string makeLoader(string name, string impl, string glVersion)
{
    return `struct ` ~ name ~
`
{
    import derelict.opengl.glloader;
    static this()
    {
        GLLoader.registerExtensionLoader("` ~ name ~ `", &load, GLVersion.` ~ glVersion ~`);
    }
    static bool load(GLLoader loader, bool doThrow)
    {
        with(loader) try {`
            ~ impl ~
`       } catch(Exception e) {
            if(doThrow) throw e;
            else return false;
        }
        return true;
    }
}`;
}