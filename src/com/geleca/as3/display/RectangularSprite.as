package com.geleca.as3.display 
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class RectangularSprite extends SimpleSprite
	{
		
		public function RectangularSprite(width:Number=1, height:Number=1, alpha:Number=1, fillColor:uint=0xffffff, border:Boolean=true, borderColor:uint=0x000000, borderSize:Number=0)
		{
			super();
			
			graphics.beginFill(fillColor, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			if(border)
			{
				graphics.lineStyle(borderSize, borderColor);
				graphics.lineTo(width, 0);
				graphics.lineTo(width, height);
				graphics.lineTo(0, height);
				graphics.lineTo(0, 0);
				graphics.lineTo(width, height);
				graphics.moveTo(0, height);
				graphics.lineTo(width, 0);
			}
			
			this.alpha = alpha;
		}
		
		public function clone():RectangularSprite
		{
			var hit:RectangularSprite = new RectangularSprite(1, 1);
			hit.alpha = this.alpha;
			hit.graphics.copyFrom(this.graphics);
			
			return hit;
		}
		
	}

}