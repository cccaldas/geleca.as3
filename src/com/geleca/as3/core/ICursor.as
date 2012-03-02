package com.geleca.as3.core
{	
	import com.geleca.as3.core.IDestroyable;
	
	public interface ICursor extends IDestroyable
	{
		function show():void;
		function hide():void;
		function move(x:Number, y:Number):void;
	}
}