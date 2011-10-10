package com.geleca.as3.test.website.view
{
	import flash.display.Sprite;
	import com.geleca.as3.mvc.core.AbstractPreloaderView;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.util.ObjectUtil;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.test.website.view.component.loader.preloader.AppLoaderPreloader;
	import com.geleca.as3.layout.LayoutSettings;
	
	//import com.geleca.as3.test.website.asset.AppLoaderViewAsset;

	public class AppLoaderView extends AbstractPreloaderView
	{
		private var _asset					:Sprite;
		
		public var prl_loader				:AppLoaderPreloader;
		
		public function AppLoaderView()
		{
			super();
			
			this.hitArea = new HitArea(300, 30);
		}
		
		override public function load():void
		{	
			loader.addLoaderItem(new AssetLoaderItem("asset", app.config["path_asset"] + "loader.swf"));
			
			super.load();			
		}
		
		override public function setup():void
		{
			super.setup();
			
			enabled = false;
			
			_asset = ObjectUtil.getObjectByClassName("com.geleca.as3.test.website.asset.loader.view.AppLoaderViewAsset");
			addChild(_asset);
			
			prl_loader = addComponent(new AppLoaderPreloader(_asset["prl_loader"]));
			
			app.layout.addElement(this, new LayoutSettings(null, null, LayoutSettings.CENTER, LayoutSettings.MIDDLE));
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			app.layout.renderElement(this);
		}
		
		override public function show(onComplete:Function=null):void
		{
			prl_loader.show();
		}
		
		override public function hide(onComplete:Function=null):void
		{
			prl_loader.hide();
		}
		
		override protected function updateProgress():void
		{
			prl_loader.progress = progress;
		}
		
	}
}