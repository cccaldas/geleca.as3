package Asset 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MainAsset extends Sprite
	{
		public var prl_preloader			:Sprite = new Sprite();
		
		public function MainAsset() 
		{
			addChild(prl_preloader);
			prl_preloader.graphics.beginFill(0x666666);
			prl_preloader.graphics.drawRect(0, 0, 2, 10);
			prl_preloader.graphics.endFill();
		}
		
	}

}