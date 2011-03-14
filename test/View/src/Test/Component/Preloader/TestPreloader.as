package Test.Component.Preloader 
{
	import flash.display.Sprite;
	import Geleca.Component.Preloader.Preloader;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TestPreloader extends Preloader
	{
		
		public function TestPreloader(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function updateProgress():void 
		{
			super.updateProgress();
			
			_asset.width = stage.stageWidth * progress;
		}
		
	}

}