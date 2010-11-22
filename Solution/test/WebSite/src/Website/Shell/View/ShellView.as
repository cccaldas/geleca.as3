package Website.Shell.View 
{
	import Geleca.View.View;
	import Website.Shell.Asset.ShellAsset;
	import Website.Shell.View.Control.FooterControl;
	import Website.Shell.View.Control.HeaderControl;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ShellView extends View
	{
		private var _asset				:ShellAsset = new ShellAsset();
		
		public var ctr_header			:HeaderControl;
		public var ctr_footer			:FooterControl;
		
		public function ShellView() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			addChild(_asset);
		}
		
		override protected function setComponents():void 
		{
			super.setComponents();
			
			ctr_header = addComponent(new HeaderControl(_asset.ctr_header)) as HeaderControl;
			ctr_footer = addComponent(new FooterControl(_asset.ctr_footer)) as FooterControl;
		}
		
	}

}