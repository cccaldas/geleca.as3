package Shell
{
	import Shell.View.MainView;
	import Asset.MainAsset;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class Shell extends Sprite 
	{
		
		public function Shell():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var asset:MainAsset = new MainAsset();
			addChild(asset);
			
			new MainView(asset).initializeView();
		}
		
	}
	
}