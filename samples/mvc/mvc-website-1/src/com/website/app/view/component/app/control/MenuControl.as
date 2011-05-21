package com.website.app.view.component.app.control 
{
	import com.geleca.as3.component.button.Button;
	import com.geleca.as3.component.Component;
	import com.geleca.as3.mvc.util.NavigateUtil;
	import com.website.asset.app.MenuControlAsset;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MenuControl extends Component
	{
		public var btn_home						:Button;
		public var btn_produtos					:Button;
		public var btn_contato					:Button;
		
		
		public function MenuControl(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			btn_home 		= addComponent(new Button(MenuControlAsset(_asset).btn_home)) as Button;
			btn_produtos 	= addComponent(new Button(MenuControlAsset(_asset).btn_produtos)) as Button;
			btn_contato 	= addComponent(new Button(MenuControlAsset(_asset).btn_contato)) as Button;
		}
		
	}

}