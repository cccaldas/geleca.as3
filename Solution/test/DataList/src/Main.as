package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import Geleca.Component.Data.DataList;
	import Geleca.View.View;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends View 
	{
		public var dlst_list		:DataList;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var container:Sprite = new Sprite();
			container.addChild(new AssetTemplate());
			
			addChild(container);
			
			dlst_list = addComponent(new DataList(container, SquareItemTemplate)) as DataList;
			dlst_list.direction = DataList.DIRECTION_VERTICAL;
			dlst_list.columns = 5;			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			var list:Array = [];
			for (var i:int = 0; i < 10; i++) 
			{
				list.push( { } );
			}
			
			dlst_list.dataSource = list;
			dlst_list.dataBind();
		}
		
	}
	
}