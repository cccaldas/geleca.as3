package com.geleca.as3.component.cursor
{
	import flash.display.Sprite;
	import com.geleca.as3.util.DepthUtil;
	import com.geleca.as3.component.Component;
	import com.geleca.as3.core.ICursor;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class CustomCursor extends Component implements ICursor
	{		
		public function CustomCursor(asset:Sprite) 
		{
			super(asset);
		}
		
		override public function setup():void
		{
			super.setup();

			enabled = false;
		}
		
		override public function init():void 
		{
			super.init();
			
			
		}
		
		override public function move(x:Number, y:Number):void 
		{
			DepthUtil.toFront(asset);
			
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