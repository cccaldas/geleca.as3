package com.website.app.view 
{
	import com.geleca.as3.effects.transition.FadeTransition;
	import com.geleca.as3.layout.LayoutSettings;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.mvc.core.AbstractPreloaderView;
	import com.website.asset.loader.preloader.LoaderPreloaderAsset;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AppLoaderView extends AbstractPreloaderView
	{
		private var _asset						:Sprite;
		
		public function AppLoaderView() 
		{
			
		}
		
		override public function load():void 
		{
			addLoaderItem(new AssetLoaderItem("asset", app.config.getAppKey("path-asset") + "loader.swf"));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			_asset = new LoaderPreloaderAsset();
			addChild(_asset);
			
			app.layout.addElement(this, new LayoutSettings(null, null, LayoutSettings.CENTER, LayoutSettings.MIDDLE));
			
			this.alpha = 0;
			
			super.setup();
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			app.layout.renderElement(this);
		}
		
		override public function show(onComplete:Function = null):void 
		{
			FadeTransition.fadeIn(this);
			
			super.show(onComplete);
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			FadeTransition.fadeOut(this);
			
			super.hide(onComplete);
		}
		
		override protected function updateProgress():void 
		{
			super.updateProgress();
			
			LoaderPreloaderAsset(_asset).sp_progress.scaleX = progress;
			
			//trace(this, "updateProgress", progress);
		}
	}

}