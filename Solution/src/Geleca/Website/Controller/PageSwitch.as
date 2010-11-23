package Geleca.Website.Controller 
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	import flash.utils.Dictionary;
	import Geleca.Controller.Controller;
	import Geleca.Events.PageEvent;
	import Geleca.Website.View.Page;
	
	/**
	 *  troca url
		checa pagina por pagina
		acha a pagina que bate com a url

		ela esta carregada:
			armazena o pathNames
			navega

		ela nao esta carregada:
			armazena o pathNames
			remove a pagina atual exibida
			exibe a nova pagina
			navega
			
		Page
			load();
				pageLoad();
				pageLoadComplete();
			unload();
				pageUnload();
				page_unload();
				pageUnloadComplete();
				page_unload_complete();
				
			cancel();
				pageCancel();
				
			show();
				load();
			
			hide()
				unload();
	 * */
	
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
		
		private function gotoPage(name:String):void 
		{
			var page:Page = getPage(name);
			page.addEventListener(PageEvent.LOAD_COMPLETE, page_loadComplete);
			
			if (_currentPage)
			{
				_currentPage.addEventListener(PageEvent.UNLOAD_COMPLETE, page_unloadComplete);
				
				function page_unloadComplete(e:PageEvent):void 
				{
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