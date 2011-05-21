package com.geleca.as3.test.layout 
{
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.layout.Layout;
	import com.geleca.as3.layout.LayoutSettings;
	import com.geleca.as3.ui.component.Component;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LayoutTest extends Sprite
	{
		private var _layout					:Layout;
		
		public var ctr_header				:Component;
		
		public function LayoutTest() 
		{
			stage.align 		= StageAlign.TOP_LEFT;
			stage.scaleMode 	=  StageScaleMode.NO_SCALE;
			
			_layout = new Layout(stage);
			
			init();
		}
		
		private function init():void
		{
			ctr_header = new Component();
			ctr_header.hitArea = new HitArea(200, 50, .3);
			addChild(ctr_header);
			ctr_header.initializeComponent();
			
			_layout.addElement(ctr_header, new LayoutSettings(null, null, LayoutSettings.CENTER, LayoutSettings.MIDDLE));
			_layout.renderElement(ctr_header);
		}
		
	}

}