package com.website.app.view 
{
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.mvc.core.AbstractAppView;
	import com.website.app.view.component.app.control.MenuControl;
	import com.website.asset.app.AppViewAsset;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class AppView extends AbstractAppView
	{
		private var _asset					:Sprite;
		public var ctr_menu					:MenuControl;
		
		public function AppView() 
		{
			
		}
		
		override public function load():void 
		{
			addLoaderItem(new AssetLoaderItem("asset", app.config.getAppKey("path-asset") + "app.swf"));
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			viewRender.y = 70;
			
			_asset = new AppViewAsset();
			addChild(_asset);
			
			_asset.y = 34;
			
			ctr_menu = addComponent(new MenuControl(AppViewAsset(_asset).ctr_menu)) as MenuControl;
			
			ctr_menu.btn_home.addEventListener(MouseEvent.CLICK, 		btn_home_click);
			ctr_menu.btn_produtos.addEventListener(MouseEvent.CLICK, 	btn_produtos_click);
			ctr_menu.btn_contato.addEventListener(MouseEvent.CLICK, 	btn_contato_click);			
		}
		
		private function btn_home_click(e:MouseEvent):void 
		{
			app.navigateURL("/");
		}
		
		private function btn_produtos_click(e:MouseEvent):void 
		{
			app.navigateURL("/produtos/");
		}
		
		private function btn_contato_click(e:MouseEvent):void 
		{
			app.navigateURL("/contato/");
		}
		
	}

}