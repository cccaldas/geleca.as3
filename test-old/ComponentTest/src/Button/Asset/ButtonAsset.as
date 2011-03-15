package Button.Asset 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ButtonAsset extends Sprite
	{
		
		public function ButtonAsset() 
		{
			graphics.beginFill(Math.random() * 0xffffff);
			graphics.drawRect(0, 0, 200, 50);
			graphics.endFill();
		}
		
	}

}