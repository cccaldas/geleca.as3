package CustomCursor
{
	import CustomCursor.Domain.Facade;
	import CustomCursor.View.MainView;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	[SWF(frameRate=30)]
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
			
			Facade.getInstance().cursorManager.stage = stage;
			
			var view:MainView = new MainView();
			addChild(view);
			view.initializeView();
		}
		
	}
	
}