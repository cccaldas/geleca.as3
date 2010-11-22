package Website.Loader.View 
{
	import Geleca.Layout.Layout;
	import Geleca.Layout.LayoutSettings;
	import Geleca.View.View;
	import Website.Domain.Facade;
	import Website.Loader.Controller.LoaderController;
	import Website.Loader.Asset.LoaderAsset;
	import Website.Loader.View.Preloader.LoaderPreloader;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderView extends View
	{
		private var _controller			:LoaderController;
		private var _asset				:LoaderAsset = new LoaderAsset();
		private var _facade				:Facade = Facade.getInstance();
		
		public var prl_loader			:LoaderPreloader;
		
		public function LoaderView() 
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
			
			prl_loader = addComponent(new LoaderPreloader(_asset.prl_loader)) as LoaderPreloader;
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			_facade.layout.stage = stage;
			
			_facade.layout.addElement(prl_loader, new LayoutSettings(null, null, Layout.CENTER, Layout.MIDDLE));
			
			_controller = new LoaderController(this);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_controller.initializeController();
			
			_facade.layout.renderElement(prl_loader);
		}
		
		public function initializeShell(shell:View):void 
		{
			addChild(shell);
			shell.initializeView();
			
			_facade.layout.removeElement(prl_loader);
			prl_loader.destroy();
		}
		
	}

}