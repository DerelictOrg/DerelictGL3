/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl.extensions.arb_v;

import derelict.opengl.types : usingContexts;
import derelict.opengl.extensions.internal;

// ARB_vertex_attrib_64bit <-- Core in 4.1
enum ARB_vertex_attrib_64bit = "GL_ARB_vertex_attrib_64bit";
enum arbVertexAttrib64BitDecls =
q{
extern(System) @nogc nothrow {
    alias da_glVertexAttribL1d = void function(GLuint, GLdouble);
    alias da_glVertexAttribL2d = void function(GLuint, GLdouble, GLdouble);
    alias da_glVertexAttribL3d = void function(GLuint, GLdouble, GLdouble, GLdouble);
    alias da_glVertexAttribL4d = void function(GLuint, GLdouble, GLdouble, GLdouble, GLdouble);
    alias da_glVertexAttribL1dv = void function(GLuint, const(GLdouble)*);
    alias da_glVertexAttribL2dv = void function(GLuint, const(GLdouble)*);
    alias da_glVertexAttribL3dv = void function(GLuint, const(GLdouble)*);
    alias da_glVertexAttribL4dv = void function(GLuint, const(GLdouble)*);
    alias da_glVertexAttribLPointer = void function(GLuint, GLint, GLenum, GLsizei, const(GLvoid)*);
    alias da_glGetVertexAttribLdv = void function(GLuint, GLenum, GLdouble*);
}};

enum arbVertexAttrib64BitFuncs =
q{
    da_glVertexAttribL1d glVertexAttribL1d;
    da_glVertexAttribL2d glVertexAttribL2d;
    da_glVertexAttribL3d glVertexAttribL3d;
    da_glVertexAttribL4d glVertexAttribL4d;
    da_glVertexAttribL1dv glVertexAttribL1dv;
    da_glVertexAttribL2dv glVertexAttribL2dv;
    da_glVertexAttribL3dv glVertexAttribL3dv;
    da_glVertexAttribL4dv glVertexAttribL4dv;
    da_glVertexAttribLPointer glVertexAttribLPointer;
    da_glGetVertexAttribLdv glGetVertexAttribLdv;
};

enum arbVertexAttrib64BitLoaderImpl =
q{
    bindGLFunc(cast(void**)&glVertexAttribL1d, "glVertexAttribL1d");
    bindGLFunc(cast(void**)&glVertexAttribL2d, "glVertexAttribL2d");
    bindGLFunc(cast(void**)&glVertexAttribL3d, "glVertexAttribL3d");
    bindGLFunc(cast(void**)&glVertexAttribL4d, "glVertexAttribL4d");
    bindGLFunc(cast(void**)&glVertexAttribL1dv, "glVertexAttribL1dv");
    bindGLFunc(cast(void**)&glVertexAttribL2dv, "glVertexAttribL2dv");
    bindGLFunc(cast(void**)&glVertexAttribL3dv, "glVertexAttribL3dv");
    bindGLFunc(cast(void**)&glVertexAttribL4dv, "glVertexAttribL4dv");
    bindGLFunc(cast(void**)&glVertexAttribLPointer, "glVertexAttribLPointer");
    bindGLFunc(cast(void**)&glGetVertexAttribLdv, "glGetVertexAttribLdv");
};

enum arbVertexAttrib64BitLoader = makeLoader(ARB_vertex_attrib_64bit, arbVertexAttrib64BitLoaderImpl, "gl41");
static if(!usingContexts) enum arbVertexAttrib64Bit = arbVertexAttrib64BitDecls ~ arbVertexAttrib64BitFuncs.makeGShared() ~ arbVertexAttrib64BitLoader;

// ARB_vertex_attrib_binding <-- Core in GL 4.3
enum ARB_vertex_attrib_binding = "GL_ARB_vertex_attrib_binding";
enum arbVertexAttribBindingDecls =
q{
enum : uint
{
    GL_VERTEX_ATTRIB_BINDING          = 0x82D4,
    GL_VERTEX_ATTRIB_RELATIVE_OFFSET  = 0x82D5,
    GL_VERTEX_BINDING_DIVISOR         = 0x82D6,
    GL_VERTEX_BINDING_OFFSET          = 0x82D7,
    GL_VERTEX_BINDING_STRIDE          = 0x82D8,
    GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9,
    GL_MAX_VERTEX_ATTRIB_BINDINGS     = 0x82DA,
}
extern(System) @nogc nothrow
{
    alias da_glBindVertexBuffer = void function(GLuint,GLuint,GLintptr,GLsizei);
    alias da_glVertexAttribFormat = void function(GLuint,GLint,GLenum,GLboolean,GLuint);
    alias da_glVertexAttribIFormat = void function(GLuint,GLint,GLenum,GLuint);
    alias da_glVertexAttribLFormat = void function(GLuint,GLint,GLenum,GLuint);
    alias da_glVertexAttribBinding = void function(GLuint,GLuint);
    alias da_glVertexBindingDivisor = void function(GLuint,GLuint);
    alias da_glVertexArrayBindVertexBufferEXT = void function(GLuint,GLuint,GLuint,GLintptr,GLsizei);
    alias da_glVertexArrayVertexAttribFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLboolean,GLuint);
    alias da_glVertexArrayVertexAttribIFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayVertexAttribLFormatEXT = void function(GLuint,GLuint,GLint,GLenum,GLuint);
    alias da_glVertexArrayVertexAttribBindingEXT = void function(GLuint,GLuint,GLuint);
    alias da_glVertexArrayVertexBindingDivisorEXT = void function(GLuint,GLuint,GLuint);
}};

enum arbVertexAttribBindingFuncs =
q{
    da_glBindVertexBuffer glBindVertexBuffer;
    da_glVertexAttribFormat glVertexAttribFormat;
    da_glVertexAttribIFormat glVertexAttribIFormat;
    da_glVertexAttribLFormat glVertexAttribLFormat;
    da_glVertexAttribBinding glVertexAttribBinding;
    da_glVertexBindingDivisor glVertexBindingDivisor;
    da_glVertexArrayBindVertexBufferEXT glVertexArrayBindVertexBufferEXT;
    da_glVertexArrayVertexAttribFormatEXT glVertexArrayVertexAttribFormatEXT;
    da_glVertexArrayVertexAttribIFormatEXT glVertexArrayVertexAttribIFormatEXT;
    da_glVertexArrayVertexAttribLFormatEXT glVertexArrayVertexAttribLFormatEXT;
    da_glVertexArrayVertexAttribBindingEXT glVertexArrayVertexAttribBindingEXT;
    da_glVertexArrayVertexBindingDivisorEXT glVertexArrayVertexBindingDivisorEXT;
};

enum arbVertexAttribBindingLoaderImpl =
q{
    bindGLFunc(cast(void**)&glBindVertexBuffer, "glBindVertexBuffer");
    bindGLFunc(cast(void**)&glVertexAttribFormat, "glVertexAttribFormat");
    bindGLFunc(cast(void**)&glVertexAttribIFormat, "glVertexAttribIFormat");
    bindGLFunc(cast(void**)&glVertexAttribLFormat, "glVertexAttribLFormat");
    bindGLFunc(cast(void**)&glVertexAttribBinding, "glVertexAttribBinding");
    bindGLFunc(cast(void**)&glVertexBindingDivisor, "glVertexBindingDivisor");
    try {
        bindGLFunc(cast(void**)&glVertexArrayBindVertexBufferEXT, "glVertexArrayBindVertexBufferEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribFormatEXT, "glVertexArrayVertexAttribFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribIFormatEXT, "glVertexArrayVertexAttribIFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribLFormatEXT, "glVertexArrayVertexAttribLFormatEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexAttribBindingEXT, "glVertexArrayVertexAttribBindingEXT");
        bindGLFunc(cast(void**)&glVertexArrayVertexBindingDivisorEXT, "glVertexArrayVertexBindingDivisorEXT");
    }
    catch(Exception e) {}
};

enum arbVertexAttribBindingLoader = makeLoader(ARB_vertex_attrib_binding, arbVertexAttribBindingLoaderImpl, "gl43");
static if(!usingContexts) enum arbVertexAttribBinding = arbVertexAttribBindingDecls ~ arbVertexAttribBindingFuncs.makeGShared() ~ arbVertexAttribBindingLoader;

// ARB_vertex_type_10f_11f_11f_rev <-- Core in GL 4.4
enum ARB_vertex_type_10f_11f_11f_rev = "GL_ARB_vertex_type_10f_11f_11f_rev";
enum arbVertexType10f11f11fRevLoader = makeLoader(ARB_vertex_type_10f_11f_11f_rev, "", "gl44");
static if(!usingContexts) enum arbVertexType10f11f11fRev = arbVertexType10f11f11fRevLoader;

// ARB_viewport_array <-- Core in GL 4.1
enum ARB_viewport_array = "GL_ARB_viewport_array";
enum arbViewportArrayDecls =
q{
enum : uint
{
    GL_MAX_VIEWPORTS                  = 0x825B,
    GL_VIEWPORT_SUBPIXEL_BITS         = 0x825C,
    GL_VIEWPORT_BOUNDS_RANGE          = 0x825D,
    GL_LAYER_PROVOKING_VERTEX         = 0x825E,
    GL_VIEWPORT_INDEX_PROVOKING_VERTEX = 0x825F,
    GL_UNDEFINED_VERTEX               = 0x8260,
}
extern(System) @nogc nothrow {
    alias da_glViewportArrayv = void function(GLuint, GLsizei, const(GLfloat)*);
    alias da_glViewportIndexedf = void function(GLuint, GLfloat, GLfloat, GLfloat, GLfloat);
    alias da_glViewportIndexedfv = void function(GLuint, const(GLfloat)*);
    alias da_glScissorArrayv = void function(GLuint, GLsizei, const(GLint)*);
    alias da_glScissorIndexed = void function(GLuint, GLint, GLint, GLsizei, GLsizei);
    alias da_glScissorIndexedv = void function(GLuint, const(GLint)*);
    alias da_glDepthRangeArrayv = void function(GLuint, GLsizei, const(GLclampd)*);
    alias da_glDepthRangeIndexed = void function(GLuint, GLclampd, GLclampd);
    alias da_glGetFloati_v = void function(GLenum, GLuint, GLfloat*);
    alias da_glGetDoublei_v = void function(GLenum, GLuint, GLdouble*);
}};

enum arbViewportArrayFuncs =
q{
    da_glViewportArrayv glViewportArrayv;
    da_glViewportIndexedf glViewportIndexedf;
    da_glViewportIndexedfv glViewportIndexedfv;
    da_glScissorArrayv glScissorArrayv;
    da_glScissorIndexed glScissorIndexed;
    da_glScissorIndexedv glScissorIndexedv;
    da_glDepthRangeArrayv glDepthRangeArrayv;
    da_glDepthRangeIndexed glDepthRangeIndexed;
    da_glGetFloati_v glGetFloati_v;
    da_glGetDoublei_v glGetDoublei_v;
};

enum arbViewportArrayLoaderImpl =
q{
    bindGLFunc(cast(void**)&glViewportArrayv, "glViewportArrayv");
    bindGLFunc(cast(void**)&glViewportIndexedf, "glViewportIndexedf");
    bindGLFunc(cast(void**)&glViewportIndexedfv, "glViewportIndexedfv");
    bindGLFunc(cast(void**)&glScissorArrayv, "glScissorArrayv");
    bindGLFunc(cast(void**)&glScissorIndexed, "glScissorIndexed");
    bindGLFunc(cast(void**)&glScissorIndexedv, "glScissorIndexedv");
    bindGLFunc(cast(void**)&glDepthRangeArrayv, "glDepthRangeArrayv");
    bindGLFunc(cast(void**)&glDepthRangeIndexed, "glDepthRangeIndexed");
    bindGLFunc(cast(void**)&glGetFloati_v, "glGetFloati_v");
    bindGLFunc(cast(void**)&glGetDoublei_v, "glGetDoublei_v");
};

enum arbViewportArrayLoader = makeLoader(ARB_viewport_array, arbViewportArrayLoaderImpl, "gl41");
static if(!usingContexts) enum arbViewportArray = arbViewportArrayDecls ~ arbViewportArrayFuncs.makeGShared() ~ arbViewportArrayLoader;