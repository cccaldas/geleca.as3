package com.geleca.as3.test.gml
{
	import flash.display.Sprite;
	
	public class SpriteSkin extends Sprite
	{
		public function SpriteSkin()
		{
			graphics.beginFill(0xff0000);
			graphics.drawRect(0,0,200,50);
			graphics.endFill();
		}
	}
}