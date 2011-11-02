' Copyright (c) 2011, Bruce A Henderson
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'     * Redistributions of source code must retain the above copyright
'       notice, this list of conditions and the following disclaimer.
'     * Redistributions in binary form must reproduce the above copyright
'       notice, this list of conditions and the following disclaimer in the
'       documentation and/or other materials provided with the distribution.
'     * Neither the name of Bruce A Henderson nor the
'       names of its contributors may be used to endorse or promote products
'       derived from this software without specific prior written permission.
'
' THIS SOFTWARE IS PROVIDED BY Bruce A Henderson ``AS IS'' AND ANY
' EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL Bruce A Henderson BE LIABLE FOR ANY
' DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
' ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Rem
bbdoc: Theora Video Player
End Rem
Module BaH.TheoraPlayer

ModuleInfo "CC_OPTS: -fexceptions"
?win32
ModuleInfo "CC_OPTS: -DTHEORAVIDEO_STATIC"
?

Import "common.bmx"


Rem
bbdoc: 
End Rem
Type TTheoraVideoManager

	Field managerPtr:Byte Ptr
	
	
	Method Create:TTheoraVideoManager()
		managerPtr = bmx_TheoraVideoManager_new()
		Return Self
	End Method
	
	Method createVideoClip:TTheoraVideoClip(filename:String, outputMode:Int = TH_RGB, numPrecachedOverride:Int = 0, usePower2Stride:Int = 0)
		Return TTheoraVideoClip._create(bmx_TheoraVideoManager_createVideoClip(managerPtr, filename, outputMode, numPrecachedOverride, usePower2Stride))
	End Method
	
	Method destroyVideoClip(clip:TTheoraVideoClip)
	
	End Method
	
	Method update(timeIncrease:Float)
		bmx_TheoraVideoManager_update(managerPtr, timeIncrease)
	End Method
	
	Method getVersionString:String()
	End Method
	
	Method getVersion(a:Int Var, b:Int Var, c:Int Var)
	End Method
	
	Method Free()
		If managerPtr Then
			bmx_TheoraVideoManager_free(managerPtr)
			managerPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

End Type


Rem
bbdoc: 
End Rem
Type TTheoraVideoClip

	Field clipPtr:Byte Ptr
	
	Function _create:TTheoraVideoClip(clipPtr:Byte Ptr)
		If clipPtr Then
			Local this:TTheoraVideoClip = New TTheoraVideoClip
			this.clipPtr = clipPtr
			Return this
		End If
	End Function
	
	Method getNextFrame:TTheoraVideoFrame()
		Return TTheoraVideoFrame._create(bmx_TTheoraVideoClip_getNextFrame(clipPtr))
	End Method

	Method getName:String()
		Return bmx_TheoraVideoClip_getName(clipPtr)
	End Method
	
	Method getWidth:Int()
		Return bmx_TheoraVideoClip_getWidth(clipPtr)
	End Method
	
	Method getHeight:Int()
		Return bmx_TheoraVideoClip_getHeight(clipPtr)
	End Method
	
	Method getStride:Int()
		Return bmx_TheoraVideoClip_getStride(clipPtr)
	End Method
	
	Method popFrame()
		bmx_TheoraVideoClip_popFrame(clipPtr)
	End Method
	
End Type


Rem
bbdoc: 
End Rem
Type TTheoraVideoFrame

	Field framePtr:Byte Ptr

	Function _create:TTheoraVideoFrame(framePtr:Byte Ptr)
		If framePtr Then
			Local this:TTheoraVideoFrame = New TTheoraVideoFrame
			this.framePtr = framePtr
			Return this
		End If
	End Function
	
	Method getBuffer:Byte Ptr()
		Return bmx_TheoraVideoFrame_getBuffer(framePtr)
	End Method

End Type
