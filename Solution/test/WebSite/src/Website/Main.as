package Website 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import Geleca.Util.StatsMonitor;
	import Website.Loader.View.LoaderView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	[SWF(frameRate=30)]
	public class Main extends Sprite
	{
		
		public function Main() 
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	= StageScaleMode.NO_SCALE;
			
			
			
			var view:LoaderView = new LoaderView();
			addChild(view);
			
			addChild(new StatsMonitor());
			
			view.initializeView();
		}
		
	}

}