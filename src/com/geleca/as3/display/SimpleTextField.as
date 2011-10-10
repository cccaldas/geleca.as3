package com.geleca.as3.display
{
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.events.EventManager;
	
	import flash.text.TextField;

	public class SimpleTextField extends TextField implements IDestroyable
	{
		public function SimpleTextField(multiline:Boolean=false,
										type:String="dynamic",
										autoSize:String="left", 
										selectable:Boolean=false, 
										border:Boolean=false,
										enabled:Boolean=true)
		{
			super();
			
			this.multiline 		= multiline;
			this.type 			= type;
			this.autoSize 		= autoSize;
			this.selectable 	= selectable;
			this.border 		= border;
			this.mouseEnabled 	= enabled;
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