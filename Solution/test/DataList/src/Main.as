package 
{
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import Simbionte.View.Component.Data.DataList;
	
	/**
	 * ...
	 * @author 
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
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var container:Sprite = new Sprite();
			container.addChild(new AssetTemplate());
			
			addChild(container);
			
			var dataList:DataList = new DataList(container, SquareItemTemplate);
			dataList.direction = DataList.DIRECTION_VERTICAL;
			dataList.columns = 5;
			dataList.initializeView();
			
			var dp:DataProvider = new DataProvider();
			for (var i:int = 0; i < 10; i++) 
			{
				dp.addItem( { } );
			}
			
			dataList.dataSource = dp;
			dataList.dataBind();
		}
		
	}
	
}