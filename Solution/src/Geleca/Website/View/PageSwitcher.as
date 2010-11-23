package Geleca.Website.View 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import flash.utils.Dictionary;
	import Geleca.Events.PageEvent;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class PageSwitcher extends View
	{
		//Página Atual selecionada
		private var _currentPage				:Page;
		
		private var _pages						:Dictionary = new Dictionary();
		
		
		public function PageSwitcher() 
		{
			
		}
		
		override protected function setListeners():void 
		{
			super.setListeners();
			
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, swfAddress_change);
		} 
		
		private function swfAddress_change(e:SWFAddressEvent):void 
		{
			checkRoute(e.pathNames);
		}
		
		private function checkRoute(pathNames:Array):void 
		{
			//trace(this, "checkRoute", pathNames);
			
			var page:Page;
			for (var name:String in _pages) 
			{
				page = getPage(name);
				if (page.checkRoute(pathNames))
				{
					page.pathNames = pathNames;
					
					if (page == _currentPage)
					{
						if (page.loaded)
							page.navigate();
						else 
							page.addEventListener(PageEvent.LOAD_COMPLETE, page_loadComplete);
					}
					else 
						gotoPage(name);
				}
			}
			
			function page_loadComplete(e:PageEvent):void
			{
				Page(e.currentTarget).navigate();
				Page(e.currentTarget).removeEventListener(PageEvent.LOAD_COMPLETE, page_loadComplete);
			}
		}
		
		public function removePage(name:String):void 
		{
			getPage(name).destroy();
			_pages[name] = null;
			
			delete _pages[name];
		}
		
		private function gotoPage(name:String):void 
		{
			//trace(this, "gotoPage", name);
			var page:Page = getPage(name);
			page.addEventListener(PageEvent.LOAD_COMPLETE, page_loadComplete);
			
			if (_currentPage)
			{
				_currentPage.addEventListener(PageEvent.UNLOAD_COMPLETE, page_unloadComplete);
				_currentPage.unload();
				
				//trace(this, "unloadPage");
				
				function page_unloadComplete(e:PageEvent):void 
				{
					//trace(this, "page_unloadComplete", e.currentTarget);
					Page(e.currentTarget).removeEventListener(PageEvent.UNLOAD_COMPLETE, page_unloadComplete);
					page.load();
				}
			}
			else
				page.load();
				
			_currentPage = page;
			
			function page_loadComplete(e:PageEvent):void 
			{
				Page(e.currentTarget).navigate();
				Page(e.currentTarget).removeEventListener(PageEvent.LOAD_COMPLETE, page_loadComplete);
			}
		}
		
		public function addPage(page:Page):void 
		{
			_pages[page.getPageName()] = page;
			
			addView(page);
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