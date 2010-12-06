package Geleca.Effects.Transition
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
		
		public static function colorTo(target:DisplayObject, color:uint, time:Number=.7, onComplete:Function=null):void 
		{
			if (!_colorShortInit)
			{
				ColorShortcuts.init();
				_colorShortInit = true;
			}
			
			Tweener.addTween(target, { _color:color, time:time, onComplete:onComplete } );
		}
		
	}

}