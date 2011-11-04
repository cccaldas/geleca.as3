package com.geleca.as3.mvc.core
{
	import com.geleca.as3.core.IDestroyable;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.display.HitArea;
	import com.geleca.as3.events.SimpleEventDispatcher;
	import com.geleca.as3.events.StateEvent;
	import com.geleca.as3.i18n.Lang;
	import com.geleca.as3.loading.GLoader;
	import com.geleca.as3.loading.LoaderItem;
	import com.geleca.as3.ui.component.UIComponent;
	import com.geleca.as3.util.ContainerUtil;
	import com.geleca.as3.util.DictionaryUtil;
	
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.ProgressEvent;
	import flash.system.System;
	import flash.utils.Dictionary;
	import com.geleca.as3.component.IComponent;
	import flash.display.DisplayObject;
	import com.geleca.as3.view.View;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MVCView extends View
	{		
		public var model									:*;
		
		public var viewData									:Dictionary = new Dictionary();
		public var app										:MVCApp;
		
		public var result									:ActionResult;
		
		public function MVCView() 
		{
			super();
		}
		
		public function action(act:String):void 
		{
			
		}
		
		override public function destroy():void 
		{
			DictionaryUtil.clear(viewData);
			
			super.destroy();
		}
	}

}