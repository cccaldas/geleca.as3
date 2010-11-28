package Website.Shell.View.Preloader 
{
	import Geleca.Component.Preloader.Preloader;
	import Geleca.Effects.Transition.FadeTransition;
	import Website.Shell.Asset.Preloader.PagesPreloaderAsset;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PagesPreloader extends Preloader
	{
		
		public function PagesPreloader(asset:PagesPreloaderAsset) 
		{
			super(asset);
		}
		
		protected function get asset():PagesPreloaderAsset { return PagesPreloaderAsset(_asset); }
		
		override protected function setup():void 
		{
			super.setup();
			
			asset.visible = false;
			asset.alpha = 0;
		}
		
		override protected function updateProgress():void 
		{
			super.updateProgress();
			
			asset.width = stage.stageWidth * progress;
			
			//trace(this, "updateProgress", progress);
		}
		
		public function show():void 
		{
			asset.visible = true;
			FadeTransition.fadeIn(asset);
		}
		
		public function hide():void 
		{
			FadeTransition.fadeOut(asset, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				asset.visible = false;
			}
		}
		
	}

}