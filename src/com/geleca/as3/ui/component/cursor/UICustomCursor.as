package com.geleca.as3.ui.component.cursor
{
	import flash.display.Sprite;
	import com.geleca.as3.util.DepthUtil;
	import com.geleca.as3.ui.component.UIComponent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class UICustomCursor extends UIComponent
	{		
		public function UICustomCursor(skin:Class) 
		{
			super(skin);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			enabled = false;
		}
		
		override public function move(x:Number, y:Number):void 
		{
			DepthUtil.toFront(this);
			
			super.move(x, y);
		}
		
		public function show():void 
		{
			
		}
		
		public function hide():void 
		{
			
		}
		
	}

}