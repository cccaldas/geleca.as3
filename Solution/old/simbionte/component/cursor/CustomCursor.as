package simbionte.component.cursor
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import simbionte.component.Component;
	import simbionte.events.ComponentEvent;
	
	public class CustomCursor extends Component
	{
		protected var _asset						:Sprite;
		
		public function CustomCursor(asset:Sprite) 
		{
			_asset = asset;
		}
		
		override protected function setVariables():void 
		{
			_asset.mouseEnabled = _asset.mouseChildren = false;
		}
		
		public function move(point:Point):void 
		{
			_asset.x = point.x;
			_asset.y = point.y;
		}
		
	}

}