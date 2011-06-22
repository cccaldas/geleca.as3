package com.geleca.as3.display 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HitArea extends RectangularSprite
	{		
		public function HitArea(width:Number=1, height:Number=1, alpha:Number=0, fillColor:uint=0xffffff, lineColor:uint=0x000000)
		{
			super(width, height, alpha, fillColor, lineColor, 0);
			
			mouseEnabled = mouseChildren = false;
		}
		
	}

}