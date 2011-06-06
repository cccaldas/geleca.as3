package com.geleca.as3.test.collection 
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.test.Assert;
	import com.geleca.as3.util.ArrayUtil;
	import com.geleca.as3.view.View;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CollectionTest 
	{
		
		public function run():void 
		{
			var list:List = new List();
			
			for (var i:int = 0; i < 20; i++) 
			{
				var item:Object = { };
				list.add(item);
				
				item.id		= i;
				item.width 	= Math.random() * 1002;
				item.x 		= Math.random() * 1002;
				item.height = Math.random() * 900;
				item.y 		= Math.random() * 900;
			}
			
			//reportItems(list.where("id", "any", ArrayUtil.castAllItems(["2", "3", "5", "6"], Number)).orderBy("random").items);
			Assert.assertEquals(list.limit(3).items.length, 3);
			Assert.assertEquals(list.limit(1).items.length, 20);
		}
		
		private function reportItems(items:Array):void 
		{
			Assert.assertEquals(items.length, 3);
			
			GLog.log("reportItems");
			for (var i:int = 0; i < items.length; i++) 
			{
				var item:Object = items[i];
				GLog.log(item, "id", item.id);
			}
		}
		
	}
	
}