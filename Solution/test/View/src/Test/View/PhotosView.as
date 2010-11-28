package Test.View 
{
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.View.Loading.AssetLoaderItem;
	import Geleca.View.Loading.FileLoaderItem;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PhotosView extends View
	{
		
		public function PhotosView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new AssetLoaderItem("photo-4", "http://img.brothersoft.com/screenshots/softimage/p/photo_collage-34262-1.jpeg"));
			addLoaderItem(new FileLoaderItem("data", "http://www.geleca.com.br"));
			addLoaderItem(new FileLoaderItem("data 2", "http://www.simbionte.com.br"));
			addLoaderItem(new FileLoaderItem("data 3", "http://www.brunozanet.com.br"));
			addLoaderItem(new FileLoaderItem("data 4", "http://www.stonexperience.com.br"));
			
			this.alpha = 0;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			addChild(loader.getItem("photo-4"));
			
			this.show();
		}
		
		override public function show(onComplete:Function = null):void 
		{
			super.show(onComplete);
			
			FadeTransition.fadeIn(this);
		}
		
	}

}