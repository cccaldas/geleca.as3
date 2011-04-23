package ui.skin 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProductItemTemplateSkin extends Sprite
	{
		
		public function ProductItemTemplateSkin() 
		{
			graphics.beginFill(Math.random() * 0xffffff);
			graphics.drawRect(0, 0, 200, 200);
			graphics.endFill();
		}
		
	}

}