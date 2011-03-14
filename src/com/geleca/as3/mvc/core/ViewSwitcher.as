package com.geleca.as3.mvc.core 
{
	import com.geleca.as3.display.SimpleSprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ViewSwitcher extends SimpleSprite
	{
		private var _current				:View;
		
		public function ViewSwitcher() 
		{
			
		}
		
		public function swap(view:View):void 
		{
			if (view == _current)
				return;
			
			if (_current)
			{
				_current.destroy();
				removeChild(_current);
			}
				
			_current = view;
			
			addChild(view);
			view.initializeView();
			view.show();
		}
		
		public function getCurrent():View
		{
			return _current;
		}
		
	}

}