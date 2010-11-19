package simbionte.events 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class FrameEvent extends Event 
	{
		public static const FIRST_FRAME    :String = "firstFrame";
		public static const LAST_FRAME     :String = "lastFrame";
		public static const MIDDLE_FRAME   :String = "middleFrame";
		
		public function FrameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			//MovieClip(this.currentTarget).stop();
		} 
		
		public override function clone():Event 
		{ 
			return new FrameEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("FrameEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}