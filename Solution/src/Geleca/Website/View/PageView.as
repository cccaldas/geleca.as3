package Geleca.Website.View 
{
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageView extends View
	{
		private var _page				:Page;
		
		public function PageView() 
		{
			
		}
		
		public function navigate():void 
		{
			
		}
		
		public function get page():Page { return _page; }
		
		public function set page(value:Page):void 
		{
			_page = value;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_page = null;
		}
		
	}

}