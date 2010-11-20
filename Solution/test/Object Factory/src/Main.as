package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Geleca.Core.ObjectFactory;
	import Geleca.Util.TestUtil;
	
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
			
			
			
			trace(this, "Com Factory", TestUtil.calcSpeed(new Test().runFactory).toString() + "ms");
			trace(this, "Sem Factory", TestUtil.calcSpeed(new Test().run).toString() + "ms");
		}
		
	}
	
}