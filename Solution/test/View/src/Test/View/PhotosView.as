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
			
<<<<<<< HEAD
			addLoaderItem(new AssetLoaderItem("photo-4", 	"upld/Acdsee-Photo-Editor_1.png"));
			addLoaderItem(new FileLoaderItem("photo-5", 	"upld/photo_collage-34262-1.jpeg"));
			addLoaderItem(new FileLoaderItem("photo-6", 	"upld/photo_montage_symbols.jpg"));
			addLoaderItem(new FileLoaderItem("photo-7", 	"upld/photo-editing.jpg"));
			addLoaderItem(new FileLoaderItem("photo-8", 	"upld/slide_show_organize_photo.gif"));
			addLoaderItem(new FileLoaderItem("data", 		"xml/data.xml"));
=======
			addLoaderItem(new AssetLoaderItem("photo-4", "http://img.brothersoft.com/screenshots/softimage/p/photo_collage-34262-1.jpeg"));
			addLoaderItem(new FileLoaderItem("data", "http://www.geleca.com.br"));
			addLoaderItem(new FileLoaderItem("data 2", "http://www.simbionte.com.br"));
			addLoaderItem(new FileLoaderItem("data 3", "http://www.brunozanet.com.br"));
			addLoaderItem(new FileLoaderItem("data 4", "http://www.stonexperience.com.br"));
>>>>>>> af6a28de2320ecc2bd71f7c151dc8b15ae536eea
			
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