package Geleca.Util
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class BitmapUtil
	{
		
		public function BitmapUtil() 
		{
			
		}
		
		public static function clone(image:Bitmap):Bitmap 
		{
			return generateBitmap(image);
		}
		
		public static function generateBitmap(object:DisplayObject, transparent:Boolean=true,fillColor:uint=4294967295):Bitmap 
		{
			var bitmapData:BitmapData = new BitmapData(object.width, object.height, transparent, fillColor);
			bitmapData.draw(object);
			
			return new Bitmap(bitmapData);
		}
		
	}

}