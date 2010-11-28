package ViewSwitcher.View 
{
	import Geleca.View.Loading.AssetLoaderItem;
	import Geleca.View.Loading.FileLoaderItem;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class IndexView extends View
	{
		
		public function IndexView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new AssetLoaderItem("photo-1", "http://lenskit.files.wordpress.com/2009/11/photo-editing.jpg"));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			addChild(loader.getItem("photo-1"));
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			this.visible = false;
			
			super.hide(onComplete);
		}
	}

}