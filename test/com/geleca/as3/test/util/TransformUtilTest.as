package com.geleca.as3.test.util 
{
	import com.geleca.as3.util.BitmapUtil;
	import com.geleca.as3.util.FunctionUtil;
	import com.geleca.as3.util.TransformUtil;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TransformUtilTest
	{
		
		public function run(stage:Stage):void
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xff0000);
			sprite.graphics.drawRect(0, 0, 500, 200);
			sprite.graphics.endFill();
			
			sprite.graphics.beginFill(0x00ff00);
			sprite.graphics.drawRect(0, 200, 500, 200);
			sprite.graphics.endFill();
			
			var img:Bitmap = BitmapUtil.generateBitmap(sprite);
			
			stage.addChild(img);
			img.x = 100;
			img.y = 100;
			
			FunctionUtil.functionDelay(flip, 2);
			
			function flip():void 
			{
				stage.removeChild(img);
				TransformUtil.flipVertical(img);
				stage.addChild(img);
			}
		}
		
	}

}