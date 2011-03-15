package Test.Asset 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TestAsset extends Sprite
	{
		public var prl_preloader			:Sprite = new Sprite();
		
		public function TestAsset() 
		{
			addChild(prl_preloader);
			prl_preloader.graphics.beginFill(0x666666);
			prl_preloader.graphics.drawRect(0, 0, 10, 10);
			prl_preloader.graphics.endFill();
		}
		
	}

}