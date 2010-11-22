package Website.Loader.Controller 
{
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import Geleca.Controller.Controller;
	import Geleca.Util.FunctionUtil;
	import Website.Loader.View.LoaderView;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class LoaderController extends Controller
	{
		private var _view							:LoaderView;
		private var _shellLoader					:ShellLoader;
		
		public function LoaderController(view:LoaderView) 
		{
			_view = view;
		}
		
		override protected function setVariables():void 
		{
			super.setVariables();
			
			_shellLoader = new ShellLoader(_view.loaderInfo);
		}
		
		override protected function setListeners():void 
		{
			super.setListeners();
			
			_shellLoader.addEventListener(ProgressEvent.PROGRESS, 		shellLoader_progress);
			_shellLoader.addEventListener(Event.COMPLETE, 				shellLoader_complete);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_shellLoader.load();
			_view.prl_loader.show();
		}
		
		private function shellLoader_progress(e:ProgressEvent):void 
		{
			_view.prl_loader.progress = _shellLoader.percentLoaded;
		}
		
		private function shellLoader_complete(e:Event):void 
		{
			FunctionUtil.functionDelay(function():void {
				_view.prl_loader.hide(prl_loader_hide_complete);
				
				function prl_loader_hide_complete():void
				{
					_view.initializeShell(_shellLoader.getShell());
					destroy();
				}
			}, .9);
		}
		
		override public function destroy():void 
		{
			_shellLoader.destroy();
			
			_shellLoader 	= null;
			_view 			= null;
			
			super.destroy();
		}
		
	}

}