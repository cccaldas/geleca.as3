package Geleca.UI
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import Geleca.Util.URLUtil;
	
	public class SimbionteContextMenu 
	{
		private const SIMBIONTE					:String = "© " + new Date().getFullYear() + " Simbionte Studios";
		private const SIMBIONTE_URL				:String = "http://www.simbionte.com.br";
		private const STATUS_FULLSCREEN			:String = "Fullscreen";
		private const STATUS_NORMAL				:String = "Normal";
		private var _contextMenu                :ContextMenu = new ContextMenu();
		
		private var _target						:Sprite;
		
		private var _simbionteItem				:ContextMenuItem;
		private var _fullscreenItem				:ContextMenuItem;
		
		public function SimbionteContextMenu(target:Sprite, showCustomMenu:Boolean=true, showFullscreen:Boolean=false) 
		{
			this._target   = target;
			
			contextMenu.hideBuiltInItems();
			contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, contextMenu_menuSelect);
			
			_simbionteItem = new ContextMenuItem(SIMBIONTE);
			_simbionteItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, itemHandler);
			
			_fullscreenItem = new ContextMenuItem(STATUS_FULLSCREEN);
			_fullscreenItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, itemHandler);

			if (showCustomMenu) 
			{
				_contextMenu.customItems.push(_simbionteItem);
			}
			
			if (showFullscreen) 
			{
				_contextMenu.customItems.push(_fullscreenItem);
			}
			
			target.contextMenu = contextMenu;
			
		}
		
		private function contextMenu_menuSelect(e:ContextMenuEvent):void 
		{
			if (_fullscreenItem)
			{
				_fullscreenItem.caption = target.stage.displayState == StageDisplayState.FULL_SCREEN ? STATUS_NORMAL : STATUS_FULLSCREEN;
			}
		}
		
		private function itemHandler(e:ContextMenuEvent):void
		{
			switch (ContextMenuItem(e.target).caption) 
			{
				case SIMBIONTE:
					URLUtil.getURL(SIMBIONTE_URL, "_blank");
				break;
				
				case STATUS_NORMAL:	
					target.stage.displayState = StageDisplayState.NORMAL;
				break;
				
				case STATUS_FULLSCREEN:
					target.stage.displayState = StageDisplayState.FULL_SCREEN;
				break;				
			}
			
		}
		
		protected function get contextMenu()	:ContextMenu 	{ return _contextMenu; }
		protected function get target()			:Sprite 		{ return _target; }
		
	}
	
}