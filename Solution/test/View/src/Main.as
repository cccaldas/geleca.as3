package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import View.MainView;
	
	/**
	 * ...
	 * @author 
	 */
	[SWF(frameRate=30)]
	public class Main extends Sprite 
	{
		private var view				:MainView = new MainView();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			addChild(view);
			view.initializeView();
			
			stage.doubleClickEnabled = true;
			stage.addEventListener(MouseEvent.DOUBLE_CLICK, stage_doubleClick);
		}
		
		private function stage_doubleClick(e:MouseEvent):void 
		{
			view.destroy();
			removeChild(view);
			view = null;
		}
		
	}
	
}