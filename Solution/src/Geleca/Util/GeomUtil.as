package Geleca.Util
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class GeomUtil 
	{
		
		public function GeomUtil()
		{
			
		}
		
		public static function getRectangleFromDisplayObject(displayObject:DisplayObject, ignoreScrollRect:Boolean=true):Rectangle 
		{
			var rectangle:Rectangle;
			//trace(displayObject);
			/*if (ignoreScrollRect) 
			{*/
				rectangle = new Rectangle(displayObject.x, displayObject.y, displayObject.width, displayObject.height);
			/*}
			else 
			{
				var virtualContent:Sprite = new Sprite();
				
				for (var i:int = 0; i < displayObject.numChildren; i++) 
				{
					var rect:Rectangle = Geom.getRectangleFromDisplayObject(displayObject.getChildAt(i));
					virtualContent.graphics.drawRect(rect.x, rect.y, rect.width, rect.height);
				}
				
				//FALTA FINALIZAR
			}*/
			
			return rectangle;
		}
		
	}
	
}