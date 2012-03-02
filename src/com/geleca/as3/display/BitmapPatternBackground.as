package com.geleca.as3.display
{
	import flash.display.BitmapData;
	import flash.display.Shape;
	import com.geleca.as3.core.IDestroyable;

	public class BitmapPatternBackground extends Shape implements IDestroyable
	{
		private var _width								:Number;
		private var _height								:Number;
		private var _data								:BitmapData;
		
		public function BitmapPatternBackground(data:BitmapData, width:Number=100, height:Number=100)
		{
			_data 		= data;
			_width 		= width;
			_height 	= height;
		}
		
		override public function get height():Number
		{
			// TODO Auto Generated method stub
			return _height;
		}
		
		override public function set height(value:Number):void
		{
			// TODO Auto Generated method stub
			_height = value;
			render();
		}
		
		override public function get width():Number
		{
			// TODO Auto Generated method stub
			return _width;
		}
		
		override public function set width(value:Number):void
		{
			// TODO Auto Generated method stub
			_width = value;
			render();
		}
		
		private function render():void
		{
			this.graphics.clear();
			this.graphics.beginBitmapFill(_data, null, true, true);
			this.graphics.drawRect(0, 0, _width, _height);
			this.graphics.endFill();
		}
		
		public function destroy():void
		{
			this.graphics.clear();
			_data.dispose();
		}
	}
}