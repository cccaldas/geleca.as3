package Geleca.Website.Controller 
{
	import flash.utils.Dictionary;
	import Geleca.Controller.Controller;
	import Geleca.Website.View.Page;
	
	public class PageSwitch extends Controller
	{
		private var _pages						:Dictionary = new Dictionary();
		
		//Página Atual selecionada
		private var _currentPage				:Page;
		
		public function PageSwitch() 
		{
			
		}
		
		public function addPage(page:Page):void 
		{
			_pages[page.getPageName()] = page;
		}
		
		public function removePage(name:String):void 
		{
			getPage(name).destroy();
			_pages[name] = null;
			
			delete _pages[name];
		}
		
		public function gotoPage(name:String, onComplete:Function=null):void 
		{
			if (_currentPage)
			{
				_currentPage.hide(currentPage_hideComplete);
				
				function currentPage_hideComplete():void 
				{
					getPage(name).show(onComplete);
				}
			}
			else
				getPage(name).show(onComplete);
				
			_currentPage = getPage(name);
		}
		
		public function getPage(name:String):Page
		{
			return Page(_pages[name]);
		}
		
		public function getCurrentPage():Page
		{
			return _currentPage;
		}
		
	}

}