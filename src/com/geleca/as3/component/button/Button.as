package com.geleca.as3.component.button 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.component.Component;
	import com.geleca.as3.events.ButtonEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class Button extends Component
	{
		
		public function Button(asset:Sprite) 
		{
			super(asset);
		}
		
		override public function setup():void 
		{
			super.setup();
			
			asset.buttonMode = true;
			
			asset.addEventListener(MouseEvent.CLICK, 		asset_click);
			asset.addEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.addEventListener(MouseEvent.ROLL_OUT, 	asset_rollOut);
			asset.addEventListener(MouseEvent.MOUSE_DOWN, 	asset_mouseDown);
			asset.addEventListener(MouseEvent.MOUSE_UP, 	asset_mouseUp);
			asset.addEventListener(MouseEvent.MOUSE_WHEEL,	asset_mouseWheel);
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
			
			if (stage)
				stage.addEventListener(MouseEvent.MOUSE_UP, stage_click);
		}
		
		private function stage_click(e:MouseEvent):void 
		{
			if (stage)
				stage.removeEventListener(MouseEvent.MOUSE_UP, stage_click);
			
			if (e.target != asset)
			{
				dispatchEvent(new ButtonEvent(ButtonEvent.RELEASE_OUT_SIDE));
				releaseOutSide();
			}
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
		
		protected function releaseOutSide():void 
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
		
		override protected function focusIn():void 
		{
			if(stage)
				stage.addEventListener(KeyboardEvent.KEY_DOWN, focusIn_stage_keyDown, false, 0, true);
				
			if (enabled)
				rollOver();
			
			super.focusIn();
		}
		
		override protected function focusOut():void 
		{
			if(stage)
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, focusIn_stage_keyDown);
			
			if (enabled)
				rollOut();
			
			super.focusOut();
		}
		
		private function focusIn_stage_keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE || e.keyCode == Keyboard.ENTER)
				dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		
		override protected function disable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = false;
		}
		
		override protected function enable():void 
		{
			asset.mouseEnabled = asset.mouseChildren = true
		}
		
		override public function destroy():void 
		{
			asset.removeEventListener(MouseEvent.CLICK, 		asset_click);
			asset.removeEventListener(MouseEvent.ROLL_OVER, 	asset_rollOver);
			asset.removeEventListener(MouseEvent.ROLL_OUT, 	asset_rollOut);
			asset.removeEventListener(MouseEvent.MOUSE_DOWN, 	asset_mouseDown);
			asset.removeEventListener(MouseEvent.MOUSE_UP, 	asset_mouseUp);
			asset.removeEventListener(MouseEvent.MOUSE_WHEEL,	asset_mouseWheel);
			
			if (stage)
				stage.removeEventListener(MouseEvent.MOUSE_UP, stage_click);
			
			super.destroy();
		}
		
	}

}