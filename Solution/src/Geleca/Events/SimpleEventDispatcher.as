package Geleca.Events
{
	import flash.events.EventDispatcher;
	import Geleca.Core.IDestroyable;
	
	public class SimpleEventDispatcher extends EventDispatcher implements IDestroyable
	{
		public function SimpleEventDispatcher() 
		{
			
		}
		
		public function destroy():void 
		{
			EventManager.removeAllListeners(this);
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
		
	}

}