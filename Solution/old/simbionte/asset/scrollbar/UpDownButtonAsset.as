package simbionte.asset.scrollbar 
{
	import flash.display.Sprite;
	
	public class UpDownButtonAsset extends Sprite
	{
		
		public function UpDownButtonAsset() 
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 20, 20);
			graphics.endFill();
			
			graphics.beginFill(0x000000);
			graphics.moveTo(4, 12);
			graphics.lineTo(10, 6);
			graphics.lineTo(16, 12);
			graphics.lineTo(4, 12);
			graphics.endFill();
		}
		
	}

}