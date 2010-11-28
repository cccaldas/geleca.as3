package Website.Pages.Contact.Controller 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import Geleca.Events.SimpleEventDispatcher;
	import Geleca.Website.Controller.Loading.AssetLoaderItem;
	import Geleca.Website.Controller.PageLoader;
	import Website.Domain.Facade;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContactLoader extends PageLoader
	{
		private var _facade							:Facade = Facade.getInstance();
		
		public function ContactLoader() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new AssetLoaderItem("asset", _facade.appConfig.PATH_ASSETS + "Contact.swf"));
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_facade = null;
		}
		
	}

}