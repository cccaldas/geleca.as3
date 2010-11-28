package Website.Pages.Contact.View 
{
	import caurina.transitions.Tweener;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.Util.ObjectUtil;
	import Geleca.View.View;
	import Geleca.Website.View.Page;
	import Geleca.Website.View.PageView;
	
	public class ContactView extends PageView
	{
		private var _asset					:Sprite;
		
		public function ContactView() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_asset = ObjectUtil.getObjectByClassName("Website.Contact.Asset.ContactAsset") as Sprite;
			addChild(_asset);
			
			this.visible = false;
			this.alpha = 0;
		}
		
		override public function show(onComplete:Function=null):void 
		{
			this.visible = true;
			
			FadeTransition.fadeIn(this, 0, 1, .7, onComplete);
		}
		
		override public function hide(onComplete:Function=null):void 
		{
			FadeTransition.fadeOut(this, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				this.visible = false;
				
				if (onComplete != null)
					onComplete();
			}
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			_asset = null;
		}
		
	}

}