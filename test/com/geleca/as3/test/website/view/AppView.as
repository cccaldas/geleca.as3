package com.geleca.as3.test.website.view
{
	import com.geleca.as3.mvc.core.AbstractAppView;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.util.ObjectUtil;
	import flash.display.Sprite;

	public class AppView extends AbstractAppView
	{
		private var _asset					:Sprite;
		
		public function AppView()
		{
			super();
		}
		
		override public function load():void
		{
			loader.addLoaderItem(new AssetLoaderItem("asset", app.config["path_asset"] + "appview.swf"));
			
			super.load();	
		}
		
		override public function setup():void
		{
			_asset = ObjectUtil.getObjectByClassName("com.geleca.as3.test.website.asset.app.view.AppViewAsset");
			addChild(_asset);
			
			super.setup();
		}
	}
}