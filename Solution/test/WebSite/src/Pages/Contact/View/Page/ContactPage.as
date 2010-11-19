package Pages.Contact.View.Page 
{
	import Asset.Contact.ContactPageAsset;
	import Domain.PageNames;
	import flash.display.Sprite;
	import Pages.Contact.View.ContactPageView;
	import Simbionte.Website.View.Component.Page;
	
	public class ContactPage extends Page
	{
		private var _pageAsset				:ContactPageAsset;
		private var _view					:ContactPageView;
		
		public function ContactPage(asset:Sprite) 
		{
			super(asset);
		}
		
		override public function getPageName():String 
		{
			return PageNames.CONTACT;
		}
		
		override public function show(onComplete:Function):void 
		{
			_pageAsset = new ContactPageAsset();
			_asset.addChild(_pageAsset);
			
			_view = new ContactPageView(_pageAsset);
			_view.initializeView();
			_view.show(onComplete);
		}
		
		override public function hide(onComplete:Function):void 
		{
			_view.hide(view_hideComplete);
			
			function view_hideComplete():void 
			{
				_asset.removeChild(_pageAsset);
		
				_view.destroy();
				_view = null;
				_pageAsset = null;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
	}

}