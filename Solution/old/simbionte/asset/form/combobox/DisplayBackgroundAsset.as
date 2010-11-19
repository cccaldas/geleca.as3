package simbionte.asset.form.combobox 
{
	import flash.display.Sprite;
	
	public class DisplayBackgroundAsset extends Sprite
	{
		
		public function DisplayBackgroundAsset() 
		{
			graphics.beginFill(0xcccccc);
			graphics.drawRect(0, 0, 10, 10);
			graphics.endFill();
			graphics.lineTo(10, 0);
			graphics.lineTo(10, 10);
			graphics.lineTo(0, 10);
			graphics.lineTo(0, 0);
		}
		
	}

}