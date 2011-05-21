package ui.skin 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CompControlSkin extends Sprite
	{
		
		public function CompControlSkin() 
		{
			graphics.beginFill(Math.random() * 0xfff);
			graphics.drawCircle(0, 0, 200);
			graphics.endFill();
		}
		
	}

}