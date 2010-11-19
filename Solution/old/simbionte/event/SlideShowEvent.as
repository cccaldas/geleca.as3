package simbionte.events 
{
	import flash.events.Event;
	
	public class SlideShowEvent extends Event 
	{
		public static const SLIDE_DELAY          :String = "slideDelay";
		public static const SLIDE_END            :String = "slideEnd";
		
		public static const SLIDE_LOADED         :String = "slideLoaded";
		
		public function SlideShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new SlideShowEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("SlideShowEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}