module derelict.opengl.extensions.internal;

package:
string makeGShared(string funcs) { return "__gshared{" ~ funcs ~ "}"; }

version(DerelictGL3_Contexts) {
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

    string makeExtLoader(string name, string impl = "")
    {
        if(impl == "") {
            return `setExtensionState("` ~ name ~ `", isExtensionSupported("` ~ name ~ `"));`;
        }
        else return
        `if(isExtensionSupported("` ~ name ~ `")) {
            try {`
                ~ impl ~
                `setExtensionState("` ~ name ~ `", true);
            } catch(Exception e) {
                setExtensionState("` ~ name ~ `", false);
            }
        }`;
    }
}
else {
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
            static bool load(ref GLLoader loader, bool doThrow)
            {
                if(!doThrow && !loader.isExtensionSupported("` ~ name ~ `")) return false;
                with(loader) try {`
                    ~ impl ~
                `} catch(Exception e) {
                    if(doThrow) throw e;
                    else return false;
                }
                return true;
            }
        }`;
    }

    string makeExtLoader(string name, string impl = "")
    {
        auto front =
        `struct ` ~ name ~
        `
        {
            import derelict.opengl.glloader;
            static this()
            {
                GLLoader.registerExtensionLoader("` ~ name ~ `", &load, GLVersion.none);
            }
            static bool load(ref GLLoader loader, bool doThrow)
            {`;

        string back;
        if(impl == "") back = `return loader.isExtensionSupported("` ~ name ~ `"); }}`;
        else back =
            `if(!loader.isExtensionSupported("` ~ name ~ `")) return false;
            with(loader) try {`
                ~ impl ~
            `} catch(Exception e) {
                if(doThrow) throw e;
                else return false;
            }
            return true;
        }}`;

        return front ~ back;
    }
}