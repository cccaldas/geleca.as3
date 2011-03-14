package com.geleca.as3.component.cursor
{
	import flash.display.Sprite;
	import com.geleca.as3.util.DepthUtil;
	import com.geleca.as3.component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class CustomCursor extends Component
	{		
		public function CustomCursor(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			enabled = false;
		}
		
		override public function move(x:Number, y:Number):void 
		{
			DepthUtil.toFront(_asset);
			
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