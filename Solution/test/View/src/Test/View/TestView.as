package Test.View 
{
	import flash.display.Bitmap;
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
		
		public var photos				:PhotosView;
		
		public function TestView() 
		{
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			photos = addView(new PhotosView()) as PhotosView;
			photos.y = 30;
			
			addLoaderItem(new LoaderInfoLoaderItem(loaderInfo));
			addLoaderItem(new ViewLoaderItem("photos", photos));
			addLoaderItem(new AssetLoaderItem("photo-1", "http://www.mattstow.com/images/articles/symbol_photo_montage/photo_montage_symbols.jpg"));
			addLoaderItem(new AssetLoaderItem("photo-2", "http://www.dancewithshadows.com/motor/wp-content/uploads/2009/02/danica-patrick-si-bikini-photo.jpg"));
			addLoaderItem(new AssetLoaderItem("photo-3", "http://www.filetransit.com/images/screen/b600f6078c45627745068fcdb47a7d47_Morpheus_Photo_Animation_Suite.png"));
			addLoaderItem(new AssetLoaderItem("photo-4", "http://img.brothersoft.com/screenshots/softimage/p/photo_collage-34262-1.jpeg"));
			addLoaderItem(new FileLoaderItem("data", "http://www.geleca.com.br"));
			addLoaderItem(new FileLoaderItem("data 2", "http://www.simbionte.com.br"));
			addLoaderItem(new FileLoaderItem("data 3", "http://www.brunozanet.com.br"));
			
			_asset = new TestAsset();
			addChild(_asset);
			
			prl_preloader = addComponent(new TestPreloader(_asset.prl_preloader)) as TestPreloader;
			
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			new CustomContextMenu(this);
			
			stage.addEventListener(MouseEvent.CLICK, stage_click);
			addEventListener(ProgressEvent.PROGRESS, _progress);
		}
		
		private function stage_click(e:MouseEvent):void 
		{
			removeView(photos);
			photos = null;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			//addChild(loader.getItem("photo-1")).y = 30;
			
			trace(this, "initialize");
		}
		
		private function _progress(e:ProgressEvent):void 
		{
			prl_preloader.progress = loader.progress;
			trace(this, "progress", loader.progress);
		}
		
	}

}