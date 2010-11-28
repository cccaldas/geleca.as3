package Website.Shell.View.Control 
{
	import Geleca.Component.Component;
	import Geleca.Layout.Layout;
	import Geleca.Layout.LayoutSettings;
	import Website.Domain.Facade;
	import Website.Shell.Asset.Control.HeaderControlAsset;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HeaderControl extends Component
	{
		private var _facade							:Facade = Facade.getInstance();
		
		public function HeaderControl(asset:HeaderControlAsset) 
		{
			super(asset);
		}
		
		protected function get asset():HeaderControlAsset { return HeaderControlAsset(_asset); }
		
		override protected function setup():void 
		{
			super.setup();
			
			_facade.layout.addElement(asset.bg_header, new LayoutSettings("100%", null, LayoutSettings.NONE, LayoutSettings.NONE));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_facade.layout.renderElement(asset.bg_header);
		}
	}

}