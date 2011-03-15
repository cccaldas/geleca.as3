package ViewSwitcher.View 
{
	import Geleca.View.Loading.AssetLoaderItem;
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
			
			addLoaderItem(new AssetLoaderItem("photo", "http://www.filetransit.com/images/screen/5df4a9fafb146aea5be47f42aaf9f135_Magic_Photo_Editor.jpg"));
			
			this.visible = false;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			addChild(loader.getItem("photo"));
		}
		
		override public function show(onComplete:Function = null):void 
		{
			this.visible = true;
			
			super.show(onComplete);
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			this.visible = false;
			
			super.hide(onComplete);
		}
		
	}

}