package CustomCursor.View 
{
	import CustomCursor.Asset.MainViewAsset;
	import CustomCursor.Domain.Facade;
	import CustomCursor.View.Cursor.ArrowCursor;
	import Geleca.Core.CursorManager;
	import Geleca.Util.FunctionUtil;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MainView extends View
	{
		private var _asset				:MainViewAsset;
		private var _cursorManager		:CursorManager = Facade.getInstance().cursorManager;
		
		public function MainView() 
		{
			
		}
		
		override protected function setAssets():void 
		{
			super.setAssets();
			
			_asset = new MainViewAsset();
			addChild(_asset);
		}
		
		override protected function setComponents():void 
		{
			super.setComponents();
			
			_cursorManager.registerCursor(ArrowCursor.NAME, new ArrowCursor(_asset.crs_arrow));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_cursorManager.cursor = ArrowCursor.NAME;
			
			FunctionUtil.functionDelay(hide_arrow, 2)
			
			function hide_arrow():void 
			{
				_cursorManager.cursor = null;
			}
		}
		
	}

}