package com.geleca.as3.display
{
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.events.EventManager;
	
	import flash.display.Sprite;
	
	public class SimpleSprite extends Sprite implements IDestroyable
	{
		public function SimpleSprite()
		{
			
		}
		
		override  public function set hitArea(value:Sprite):void 
		{
			if (value)
			{
				addChild(value);
				super.hitArea = value;
			}
		}
		
		public function get fullWidth()		:Number { return super.width; }
		public function get fullHeight()	:Number { return super.height; }
		
		override public function get width():Number { return (hitArea) ? hitArea.width : super.width; }
		
		override public function set width(value:Number):void 
		{
			if (hitArea)
				hitArea.width = value;
			else
				super.width = value;
		}
		
		override public function get height():Number { return (hitArea) ? hitArea.height : super.height; }
		
		override public function set height(value:Number):void 
		{
			if (hitArea)
				hitArea.height = value;
			else
				super.height = value;
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void 
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			EventManager.addEventListener(this, type, listener, useCapture, priority, useWeakReference, false);
		}
		
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void 
		{
			super.removeEventListener(type, listener, useCapture);
			EventManager.removeEventListener(this, type, listener, useCapture,false);
		}
		
		public function destroy():void
		{
			EventManager.removeAllListeners(this);
		}
	}
}