package com.geleca.as3.test.ui 
{
	import com.geleca.as3.mvc.core.MVCApp;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.ui.component.Component;
	import com.geleca.as3.ui.component.data.DataList;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import ui.itemtemplate.ProductItemTemplate;
	import ui.skin.CompControlSkin;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	[SWF(width="1002", height="600", frameRate="55", backgroundColor="#000")]
	public class UIComponentsTest extends View 
	{
		public var ctr_comp					:CompControl;
		public var dlst_products			:DataList;
		
		public function UIComponentsTest() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.app = new MVCApp();
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			ctr_comp = addComponent(new CompControl(CompControlSkin));
			dlst_products = addComponent(new DataList(ProductItemTemplate));
			dlst_products.itemSpacingX = 0;
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			dlst_products.dataSource = ["", "", "", "", ""];
			dlst_products.dataBind();
		}
		
	}

}