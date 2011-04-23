package com.geleca.as3.util 
{
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ColorUtil
	{
		
		public function ColorUtil() 
		{
			
		}
		
		public static function swapColor(target:DisplayObject, color:uint):void 
		{
			var ct:ColorTransform = target.transform.colorTransform;
			ct.color = color;
			target.transform.colorTransform = ct;
		}
		
	}

}