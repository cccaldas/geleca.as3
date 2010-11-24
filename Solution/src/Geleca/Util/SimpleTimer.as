package Geleca.Util 
{
	import flash.utils.Timer;
	import Geleca.Core.IDestroyable;
	import Geleca.Events.EventManager;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class SimpleTimer extends Timer implements IDestroyable
	{
		
		public function SimpleTimer(delay:Number=0, repeatCount:int=0) 
		{
			super(delay, repeatCount);
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