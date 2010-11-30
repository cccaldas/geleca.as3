package Geleca.View 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import Geleca.View.Loading.ViewLoaderItem;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewSwitcher extends View
	{
		public static const HIDE_LOAD_SHOW	:String = "HIDE_LOAD_SHOW";
		public static const LOAD_HIDE_SHOW	:String = "LOAD_HIDE_SHOW";
		
		private var _transition				:String = HIDE_LOAD_SHOW;
		private var _current				:View;
		
		public function ViewSwitcher(first:Class, transition:String=null) 
		{
			_current = new first();
			
			if (transition)
				_transition = transition;
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addView(_current);
			addLoaderItem(new ViewLoaderItem("view", _current));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_current.show();
		}
		
		public function swap(view:Class, transition:String=null):void 
		{
			if (_current is view || view == null)
				return;
				
			if (!transition)
				transition = _transition;
				
			switch (transition) 
			{
				case HIDE_LOAD_SHOW:
					swap_hideLoadShow(view);
				break;
				
				case LOAD_HIDE_SHOW:
					swap_loadHideShow(view);
				break;
			}
		}
		
		private function swap_hideLoadShow(view:Class):void 
		{
			_current.hide(current_hideComplete);
			
			function current_hideComplete():void 
			{
				removeView(_current);
				_current = addView(new view());
				
				_current.addEventListener(ProgressEvent.PROGRESS, 	dispatchEvent);
				_current.addEventListener(Event.COMPLETE, 			current_complete);
				_current.initializeView();
			}
			
			function current_complete(e:Event):void 
			{
				dispatchEvent(e);
				_current.show();
			}
		}
		
		private function swap_loadHideShow(view:Class):void 
		{
			var _view:View = new view();
			_view.addEventListener(ProgressEvent.PROGRESS, 		dispatchEvent);
			_view.addEventListener(Event.COMPLETE, 				view_complete);
			
			addView(_view);			
			
			function view_complete(e:Event):void 
			{
				_current.hide(current_hideComplete);
			}			
			
			function current_hideComplete():void 
			{
				removeView(_current);
				_current = _view;
				_current.show();
			}
		}
		
		public function getCurrent():View
		{
			return _current;
		}
		
	}

}