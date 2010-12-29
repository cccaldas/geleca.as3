package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Geleca.Collection.List;
	import Geleca.View.View;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Main extends View 
	{
		
		public function Main():void 
		{
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			var list:List = new List();
			for (var i:int = 0; i < 20; i++) 
			{
				var item:Sprite = new Sprite();
				list.add(item);
				
				item.width 	= Math.random() * stage.stageWidth;
				item.x 		= Math.random() * stage.stageWidth;
				item.height = Math.random() * stage.stageHeight;
				item.y 		= Math.random() * stage.stageHeight;
			}
			
			reportItems(list.where("name", "like", "1").orderBy("random").items);
		}
		
		private function reportItems(items:Array):void 
		{
			trace(this, "reportItems");
			for (var i:int = 0; i < items.length; i++) 
			{
				var item:Sprite = items[i];
				trace(item, "x", item.x, item.name);
				
			}
		}
		
	}
	
}