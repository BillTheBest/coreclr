// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
// See the LICENSE file in the project root for more information.

// When the jit considers inlining B it can get itself into
// trouble because of the type mismatch. This test tries to
// ensure the jit backs out of the inline successfully.

.assembly extern mscorlib { }
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly main {}
.module main.exe

.class public sealed F extends System.ValueType
{

.method public instance void .ctor()
{
   ret
}

.field public string A
}

.method private static int64 B(int64 X, int64 Y)
{
   ldarg.0
   ret
}

.method public hidebysig static int32 Main(string[] args) cil managed
{
   .entrypoint
   .locals init (valuetype F v_0)
   ldarg.0
   ldlen
   ldc.i4 1
   bgt DONE
   newobj instance void F::.ctor()
   ldc.i8 44
   call  int64 B(int64, int64)
   pop

DONE:

   ldc.i4 100
   ret
}
