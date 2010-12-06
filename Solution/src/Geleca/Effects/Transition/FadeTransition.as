package Geleca.Effects.Transition
{
	import caurina.transitions.Tweener;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FadeTransition
	{
		
		public function FadeTransition() 
		{
			
		}
		
		public static function fadeIn(target:DisplayObject, delay:Number=0, alpha:Number=1, time:Number=.7, onComplete:Function=null):void 
		{
			Tweener.addTween(target, { alpha:alpha, delay:delay, time:time, onComplete:onComplete } );
		}
		
		public static function fadeOut(target:DisplayObject, delay:Number=0, alpha:Number=0, time:Number=.7, onComplete:Function=null):void 
		{
			Tweener.addTween(target, { alpha:alpha, delay:delay, time:time, onComplete:onComplete } );
		}
		
	}

}