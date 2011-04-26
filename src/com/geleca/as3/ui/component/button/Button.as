package com.geleca.as3.ui.component.button 
{
	import com.geleca.as3.ui.component.Component;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.ButtonEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	
	public class Button extends Component
	{
		
		public function Button(skin:Class) 
		{
			super(skin);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			buttonMode = true;
			
			addEventListener(MouseEvent.CLICK, 				_click);
			addEventListener(MouseEvent.ROLL_OVER, 			_rollOver);
			addEventListener(MouseEvent.ROLL_OUT, 			_rollOut);
			addEventListener(MouseEvent.MOUSE_DOWN, 		_mouseDown);
			addEventListener(MouseEvent.MOUSE_UP, 			_mouseUp);
			addEventListener(MouseEvent.MOUSE_WHEEL,		_mouseWheel);
		}
		
		private function _click(e:MouseEvent):void 
		{
			click();
		}
		
		private function _rollOver(e:MouseEvent):void 
		{
			rollOver();
		}
		
		private function _rollOut(e:MouseEvent):void 
		{
			if (enabled)
				rollOut();
		}
		
		private function _mouseDown(e:MouseEvent):void 
		{
			mouseDown();
			
			if (stage)
				stage.addEventListener(MouseEvent.MOUSE_UP, stage_click);
		}
		
		private function stage_click(e:MouseEvent):void 
		{
			if (stage)
				stage.removeEventListener(MouseEvent.MOUSE_UP, stage_click);
			
			if (e.target != this && e.target != skin)
			{
				dispatchEvent(new ButtonEvent(ButtonEvent.RELEASE_OUT_SIDE));
				releaseOutSide();
			}
		}
		
		private function _mouseUp(e:MouseEvent):void 
		{
			mouseUp();
		}
		
		private function _mouseWheel(e:MouseEvent):void 
		{
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
			mouseEnabled = mouseChildren = false;
		}
		
		override protected function enable():void 
		{
			mouseEnabled = mouseChildren = true
		}
		
		override public function destroy():void 
		{
			removeEventListener(MouseEvent.CLICK, 		_click);
			removeEventListener(MouseEvent.ROLL_OVER, 	_rollOver);
			removeEventListener(MouseEvent.ROLL_OUT, 	_rollOut);
			removeEventListener(MouseEvent.MOUSE_DOWN, 	_mouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, 	_mouseUp);
			removeEventListener(MouseEvent.MOUSE_WHEEL,	_mouseWheel);
			
			if (stage)
				stage.removeEventListener(MouseEvent.MOUSE_UP, stage_click);
			
			super.destroy();
		}
		
	}

}