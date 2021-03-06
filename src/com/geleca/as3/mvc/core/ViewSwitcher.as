package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.SimpleSprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewSwitcher extends SimpleSprite
	{
		private var _current				:MVCView;
		
		public function ViewSwitcher() 
		{
			super();
		}
		
		public function swap(view:MVCView, onComplete:Function=null):void 
		{
			if (view == _current)
			{
				if (onComplete != null)
					onComplete();
					
				return;
			}
			
			if (_current)
			{
				_current.hide(hideComplete);
				
				function hideComplete():void 
				{
					//_current.destroy();
					//removeChild(_current);
					initialize();
				}
			}
			else
				initialize();
			
			function initialize():void 
			{
				_current = view;
			
				addChild(view);
				//GLog.log(view, "addedToStage");
				view.initializeView();
				view.show(onComplete);
			}
			
		}
		
		public function getCurrent():MVCView
		{
			return _current;
		}
		
	}

}