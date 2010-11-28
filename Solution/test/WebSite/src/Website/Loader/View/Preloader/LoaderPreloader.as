package Website.Loader.View.Preloader 
{
	import Geleca.Component.Preloader.Preloader;
	import Geleca.Effects.Transition.FadeTransition;
	import Website.Loader.Asset.Preloader.LoaderPreloaderAsset;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderPreloader extends Preloader
	{
		
		public function LoaderPreloader(asset:LoaderPreloaderAsset) 
		{
			super(asset);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			asset.visible = false;
			asset.alpha = 0;
		}
		
		protected function get asset():LoaderPreloaderAsset { return LoaderPreloaderAsset(_asset); }
		
		public function show(onComplete:Function=null):void 
		{
			asset.visible = true;
			
			FadeTransition.fadeIn(asset, 0, 1, .7, onComplete);
		}
		
		public function hide(onComplete:Function=null):void 
		{
			FadeTransition.fadeOut(asset, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				asset.visible = false;
				
				if (onComplete != null)
					onComplete();
			}
		}
	}

}