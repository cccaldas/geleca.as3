package com.geleca.as3.util 
{
	import fl.motion.Color;
	
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
		
		public static function setTint(target:DisplayObject, color:uint, alpha:Number=1):void
		{
			var cl:Color = new Color();
			cl.setTint(color, alpha);
			
			target.transform.colorTransform = cl; 
		}
		
	}

}