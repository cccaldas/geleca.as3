package com.geleca.as3.effects.transition
{
	import caurina.transitions.properties.ColorShortcuts;
	import caurina.transitions.Tweener;
	import flash.display.DisplayObject;
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