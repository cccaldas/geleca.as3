package Pages.Contact.View 
{
	import Asset.Contact.ContactPageAsset;
	import caurina.transitions.Tweener;
	import Simbionte.View.Component.Component;
	
	public class ContactPageView extends Component
	{
		
		public function ContactPageView(asset:ContactPageAsset) 
		{
			super(asset);
		}
		
		override protected function setVariables():void 
		{
			asset.alpha = 0;
			
			super.setVariables();
		}
		
		public function show(onComplete:Function):void 
		{
			Tweener.addTween(asset, { alpha:1, time:1, onComplete:onComplete } );
		}
		
		public function hide(onComplete:Function):void 
		{
			Tweener.addTween(asset, { alpha:0, time:1, onComplete:onComplete } );
		}
		
		protected function get asset():ContactPageAsset { return ContactPageAsset(_asset); }
		
	}

}