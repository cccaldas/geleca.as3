package com.geleca.as3.ui
{
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageDisplayState;
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import com.geleca.as3.util.URLUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CustomContextMenu 
	{
		private const SIMBIONTE					:String = "© " + new Date().getFullYear() + " Simbionte Studios";
		private const SIMBIONTE_URL				:String = "http://www.simbionte.com.br";
		
		protected var caption_fullscreen		:String = "Fullscreen";
		protected var caption_normal			:String = "Normal";
		
		protected var contextMenu                :ContextMenu = new ContextMenu();
		
		private var _target						:InteractiveObject;
		
		private var _simbionteItem				:ContextMenuItem;
		private var _fullscreenItem				:ContextMenuItem;
		
		private var _showFullscreen				:Boolean;
		
		public function CustomContextMenu(target:InteractiveObject, showFullscreen:Boolean=true) 
		{
			this._target   			= target;
			this._showFullscreen 	= showFullscreen;
			
			setup();
			
			this._target.contextMenu = contextMenu;
		}
		
		protected function setup():void 
		{
			contextMenu.hideBuiltInItems();
			
			contextMenu.addEventListener(ContextMenuEvent.MENU_SELECT, contextMenu_menuSelect);
			
			if (_showFullscreen) 
			{
				_fullscreenItem = addItem(caption_fullscreen);
				
				_fullscreenItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, fullscreenItem_menuItemSelect);
			}
			
		}
		
		protected function addItem(caption:String):ContextMenuItem
		{
			var item:ContextMenuItem = new ContextMenuItem(caption);
			contextMenu.customItems.push(item);
			
			return item;
		}
		
		private function contextMenu_menuSelect(e:ContextMenuEvent):void 
		{
			if (_fullscreenItem)
			{
				_fullscreenItem.caption = _target.stage.displayState == StageDisplayState.NORMAL ? caption_fullscreen : caption_normal;
			}
		}
		
		private function fullscreenItem_menuItemSelect(e:ContextMenuEvent):void 
		{
			_target.stage.displayState = _fullscreenItem.caption == caption_fullscreen ? StageDisplayState.FULL_SCREEN : StageDisplayState.NORMAL;	
		}
		
	}
	
}