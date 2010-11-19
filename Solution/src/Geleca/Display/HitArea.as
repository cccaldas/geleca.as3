package Geleca.Display 
{
	import flash.display.Sprite;
	
	public class HitArea extends Sprite
	{
		
		public function HitArea(width:Number, height:Number, alpha:Number=0, fillColor:uint=0xffffff, lineColor:uint=0x000000)
		{
			graphics.beginFill(fillColor, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
			
			graphics.lineStyle(0,lineColor);
			graphics.lineTo(width, 0);
			graphics.lineTo(width, height);
			graphics.lineTo(0, height);
			graphics.lineTo(0, 0);
			graphics.lineTo(width, height);
			graphics.moveTo(0, height);
			graphics.lineTo(width, 0);
			
			mouseEnabled = mouseChildren = false;
			
			this.alpha = alpha;
		}
		
	}

}