package View.Preloader 
{
	import flash.display.Sprite;
	import Geleca.Component.Preloader.Preloader;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProcessPreloader extends Preloader
	{
		
		public function ProcessPreloader(asset:Sprite) 
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