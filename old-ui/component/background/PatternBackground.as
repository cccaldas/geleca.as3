package simbionte.ui.component.background 
{
	import flash.display.Bitmap;
	import simbionte.ui.component.Component;
	
	public class PatternBackground extends Component
	{
		private var _bitmap							:Bitmap;
		private var _width							:Number = 0;
		private var _height							:Number = 0;
		
		public function PatternBackground(bitmap:Bitmap) 
		{
			_bitmap = bitmap;
		}
		
		override protected function initialize():void 
		{
			renderPattern();
			
			super.initialize();
		}
		
		private function renderPattern():void 
		{
			graphics.clear();
			graphics.beginBitmapFill(_bitmap.bitmapData, null, true, true);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		override public function get height():Number { return _height; }
		
		override public function set height(value:Number):void 
		{
			_height = value;
			renderPattern();
		}
		
		override public function get width():Number { return _width; }
		
		override public function set width(value:Number):void 
		{
			_width = value;
			renderPattern();
		}
		
		override public function destroy():void 
		{
			_bitmap.bitmapData.dispose();
			
			_bitmap = null;
			
			super.destroy();
		}
		
	}

}