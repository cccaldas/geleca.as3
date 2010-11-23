package Website.Shell.View.Control 
{
	import Geleca.Component.Component;
	import Geleca.Layout.Layout;
	import Geleca.Layout.LayoutSettings;
	import Website.Domain.Facade;
	import Website.Shell.Asset.Control.FooterControlAsset;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class FooterControl extends Component
	{
		private var _facade						:Facade = Facade.getInstance();
		
		public function FooterControl(asset:FooterControlAsset) 
		{
			super(asset);
		}
		
		protected function get asset():FooterControlAsset { return FooterControlAsset(_asset); }
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			_facade.layout.addElement(asset, new LayoutSettings(null, null, Layout.NONE, Layout.BOTTOM));
			_facade.layout.addElement(asset.bg_footer, new LayoutSettings("100%", null, Layout.NONE, Layout.NONE));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_facade.layout.renderElement(asset);
			_facade.layout.renderElement(asset.bg_footer);
		}
		
	}

}