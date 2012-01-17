package com.geleca.as3.effects.transition
{
	import caurina.transitions.properties.ColorShortcuts;
	import caurina.transitions.Tweener;
	import flash.display.DisplayObject;
	import fl.motion.Color;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ColorTransition
	{
		private static var _colorShortInit	:Boolean = false;
		
		public function ColorTransition() 
		{
			
		}
		
		private static function checkInit():void 
		{
			if (!_colorShortInit)
			{
				ColorShortcuts.init();
				_colorShortInit = true;
			}
		}
		
		public static function colorTo(target:DisplayObject, color:uint, time:Number=.7, onComplete:Function=null):void 
		{
			checkInit();
			
			Tweener.addTween(target, { _color:color, time:time, onComplete:onComplete } );
		}
		
		public static function tintTo(target:DisplayObject, color:uint, alpha:Number=1, time:Number=.7, onComplete:Function=null):void 
		{
			checkInit();
			
			Tweener.addTween(target, { _color:color, time:time, onUpdate:onUpdate, onComplete:onComplete } );
			
			function onUpdate():void
			{
				var cl:Color = new Color();
				cl.setTint(target.transform.colorTransform.color, alpha);
				target.transform.colorTransform = cl;
			}
		}
		
		public static function toGrayScale(target:DisplayObject, time:Number=.5, saturation:Number=0, onComplete:Function=null):void 
		{
			checkInit();
			
			Tweener.addTween(target, {time:time, _saturation:0, onComplete:onComplete } );
		}
		
		public static function toColor(target:DisplayObject, time:Number=.5, saturation:Number=1, onComplete:Function=null):void 
		{
			checkInit();
			
			Tweener.addTween(target, {time:time, _saturation:1, onComplete:onComplete } );
		}
		
	}

}