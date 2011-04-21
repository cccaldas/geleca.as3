package simbionte.ui.component.button
{
	import flash.events.MouseEvent;
	import simbionte.net.Net;
	
	public class LinkButton extends Button
	{
		private var _url                            :String = "";
		private var _target                         :String = "_blank";
		
		public function LinkButton()
		{
			
		}
		
		public function set url(value:String):void 
		{
			_url = value;
		}
		
		public function get url()		:String { return _url; }
		public function get target()	:String { return _target; }
		
		public function set target(value:String):void 
		{
			_target = value;
		}
		
		override protected function click():void 
		{
			Net.getURL(url, target);
			
			super.click();
		}
		
	}
	
}