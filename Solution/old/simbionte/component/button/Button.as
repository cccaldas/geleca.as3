package simbionte.component.button 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import simbionte.component.Component;
	
	public class Button extends Component
	{
		private var _asset					:Sprite;
		
		public function Button(asset:Sprite) 
		{
			_asset = asset;
		}
		
		override protected function setVariables():void 
		{
			asset.buttonMode = true;
			asset.hitArea = Sprite(asset.getChildByName("sp_hitArea"));
			
			super.setVariables();
		}
		
		override protected function setListeners():void 
		{
			asset.addEventListener(MouseEvent.CLICK, 		asset_click);
			asset.addEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.addEventListener(MouseEvent.ROLL_OUT, 	asset_rollOut);
			asset.addEventListener(MouseEvent.MOUSE_DOWN, 	asset_mouseDown);
			asset.addEventListener(MouseEvent.MOUSE_UP, 	asset_mouseUp);
			asset.addEventListener(MouseEvent.MOUSE_WHEEL,	asset_mouseWheel);
			
			super.setListeners();
		}
		
		protected function get asset():Sprite { return _asset; }
		
		override public function destroy():void 
		{
			asset.removeEventListener(MouseEvent.CLICK, 		asset_click);
			asset.removeEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.removeEventListener(MouseEvent.ROLL_OUT, 		asset_rollOut);
			asset.removeEventListener(MouseEvent.MOUSE_DOWN, 	asset_mouseDown);
			asset.removeEventListener(MouseEvent.MOUSE_UP, 		asset_mouseUp);
			asset.removeEventListener(MouseEvent.MOUSE_WHEEL,	asset_mouseWheel);
			
			super.destroy();
		}
		
		private function asset_click(e:MouseEvent):void 
		{
			dispatchEvent(e);
			click();
		}
		
		private function asset_rollOver(e:MouseEvent):void 
		{
			dispatchEvent(e);
			rollOver();
		}
		
		private function asset_rollOut(e:MouseEvent):void 
		{
			if (enabled)
			{
				dispatchEvent(e);
				rollOut();
			}
		}
		
		private function asset_mouseDown(e:MouseEvent):void 
		{
			dispatchEvent(e);
			mouseDown();
		}
		
		private function asset_mouseUp(e:MouseEvent):void 
		{
			dispatchEvent(e);
			mouseUp();
		}
		
		private function asset_mouseWheel(e:MouseEvent):void 
		{
			dispatchEvent(e);
			mouseWheel();
		}
		
		protected function click():void 
		{
			
		}
		
		protected function rollOver():void 
		{
			
		}
		
		protected function rollOut():void 
		{
			
		}
		
		protected function mouseDown():void 
		{
			
		}
		
		protected function mouseUp():void 
		{
			
		}
		
		protected function mouseWheel():void 
		{
			
		}
		
		override protected function disable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = false;
		}
		
		override protected function enable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = true
		}
		
		public function set tabIndex(value:int):void 
		{
			asset.tabIndex = value;
		}
		
		public function get tabIndex():int { return asset.tabIndex; }
		
	}

}