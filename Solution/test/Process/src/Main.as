package 
{
	import Asset.MainAsset;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import Geleca.Core.ProcessGroup;
	import Geleca.Core.ProcessManager;
	import Geleca.Events.ProcessEvent;
	import Geleca.Util.FunctionUtil;
	import Geleca.View.View;
	import View.Preloader.ProcessPreloader;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	[SWF(frameRate=30)]
	public class Main extends View 
	{
		private var _asset			:MainAsset = new MainAsset();
		private var _group			:ProcessGroup;
		
		public var prl_progress		:ProcessPreloader;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			stage.align 	= StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			addChild(_asset);
			
			prl_progress = addComponent(new ProcessPreloader(_asset.prl_preloader)) as ProcessPreloader;
			
			var processes:Array = [];
			//_manager.addEventListener(ProcessEvent.PROGRESS, manager_progress);
			
			for (var i:int = 0; i < 10; i++) 
			{
				processes.push(new ProcessTest());
			}
			
			_group = new ProcessGroup(processes);
			_group.addEventListener(ProcessEvent.PROGRESS, 	group_progress);
			_group.addEventListener(ProcessEvent.FINISH, 	group_finish);
			
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_group.start();
		}
		
		private function group_finish(e:ProcessEvent):void 
		{
			_group.destroy();
			_group = null;
		}
		
		private function group_progress(e:ProcessEvent):void 
		{
			prl_progress.progress = _group.progress;
		}
		
		
	}
	
}