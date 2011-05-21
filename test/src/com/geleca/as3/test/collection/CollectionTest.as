package com.geleca.as3.test.collection 
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.test.Assert;
	import com.geleca.as3.util.ArrayUtil;
	import com.geleca.as3.view.View;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CollectionTest extends Sprite 
	{
		
		public function CollectionTest():void 
		{
			init();
		}
		
		private function init():void
		{
			run();
		}
		
		private function run():void 
		{
			var list:List = new List();
			for (var i:int = 0; i < 20; i++) 
			{
				var item:Object = { };
				list.add(item);
				
				item.id		= i;
				item.width 	= Math.random() * stage.stageWidth;
				item.x 		= Math.random() * stage.stageWidth;
				item.height = Math.random() * stage.stageHeight;
				item.y 		= Math.random() * stage.stageHeight;
			}
			
			reportItems(list.where("id", "any", ArrayUtil.castAllItems(["2", "3", "5", "6"], Number)).orderBy("random").items);
			
			//Assert.assertEquals(2, 3);
		}
		
		private function reportItems(items:Array):void 
		{
			Assert.assertEquals(items.length, 3);
			
			trace(this, "reportItems");
			for (var i:int = 0; i < items.length; i++) 
			{
				var item:Object = items[i];
				trace(item, "id", item.id);
			}
		}
		
	}
	
}