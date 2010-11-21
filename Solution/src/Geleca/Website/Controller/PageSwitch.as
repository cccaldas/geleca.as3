package Geleca.Website.Controller 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
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
		
		override protected function setListeners():void 
		{
			super.setListeners();
			
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, swfAddress_change);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			
		}
		
		private function swfAddress_change(e:SWFAddressEvent):void 
		{
			checkRoute(e.pathNames);
		}
		
		private function checkRoute(pathNames:Array):void 
		{
			var page:Page;
			for (var name:String in _pages) 
			{
				page = getPage(name);
				if (page.checkRoute(pathNames) && page != _currentPage)
				{
					page.navigate(pathNames);
					gotoPage(page.getPageName());
				}
			}
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