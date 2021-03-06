package Test.View 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import Geleca.UI.CustomContextMenu;
	import Geleca.View.Loading.AssetLoaderItem;
	import Geleca.View.Loading.FileLoaderItem;
	import Geleca.View.Loading.LoaderInfoLoaderItem;
	import Geleca.View.Loading.ViewLoaderItem;
	import Geleca.View.View;
	import Test.Asset.TestAsset;
	import Test.Component.Preloader.TestPreloader;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TestView extends View
	{
		private var _asset				:TestAsset;
		public var prl_preloader		:TestPreloader;
		
		private var asset				:Sprite;
		
		public var photos				:PhotosView;
		
		public function TestView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			photos = addView(new PhotosView()) as PhotosView;
			photos.y = 30;
			
			
			addLoaderItem(new ViewLoaderItem("photos", photos));
			
			addLoaderItem(new AssetLoaderItem("asset", 		"../assets/swc/View.swf"));
			addLoaderItem(new AssetLoaderItem("photo-4", 	"upld/Acdsee-Photo-Editor_1.png"));
			addLoaderItem(new FileLoaderItem("photo-5", 	"upld/photo_collage-34262-1.jpeg"));
			addLoaderItem(new FileLoaderItem("photo-6", 	"upld/photo_montage_symbols.jpg"));
			addLoaderItem(new FileLoaderItem("photo-7", 	"upld/photo-editing.jpg"));
			addLoaderItem(new FileLoaderItem("photo-8", 	"upld/slide_show_organize_photo.gif"));
			addLoaderItem(new FileLoaderItem("data", 		"xml/data.xml"));
			
			//addEventListener(ProgressEvent.PROGRESS, _progress);
		}
		
		private function stage_click(e:MouseEvent):void 
		{
			removeView(photos);
			photos = null;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_asset = new TestAsset();
			addChild(_asset);
			
			asset = new ViewAsset();
			addChild(asset);
			trace(this, ViewAsset(asset).btn_1, asset);
			
			prl_preloader = addComponent(new TestPreloader(_asset.prl_preloader)) as TestPreloader;
			prl_preloader.progress = .5;
			
			stage.addEventListener(MouseEvent.CLICK, stage_click);
			
			//addChild(loader.getItem("photo-1")).y = 30;
			
			trace(this, "initialize");
		}
		
		private function _progress(e:ProgressEvent):void 
		{
			//prl_preloader.progress = loader.progress;
			trace(this, "progress", loader.progress);
		}
		
	}

}