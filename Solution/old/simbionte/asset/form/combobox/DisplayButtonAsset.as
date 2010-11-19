package simbionte.asset.form.combobox 
{
	import flash.display.Sprite;
	
	public class DisplayButtonAsset extends Sprite
	{
		
		public function DisplayButtonAsset() 
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 20, 20);
			graphics.endFill();
			
			graphics.beginFill(0x000000);
			graphics.lineTo(4,6);
			graphics.lineTo(16, 6);
			graphics.lineTo(10, 12);
			graphics.lineTo(4, 6);
			graphics.endFill();
		}
		
	}

}