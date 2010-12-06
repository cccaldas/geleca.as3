package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Geleca.Display.HitArea;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var hit:HitArea = new HitArea(200, 100, 1, 0xff0000, 0x00ff00);
			
			addChild(hit);
			
			addChild(hit.clone()).x = 300;
		}
		
	}
	
}