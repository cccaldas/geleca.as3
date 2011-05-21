package com.geleca.as3.mvc.core
{
	import com.geleca.as3.events.SimpleEventDispatcher;
	
	public class Model extends SimpleEventDispatcher
	{
		public var app					:MVCApp;
		
		protected var data				:*;
		
		public function Model(app:MVCApp)
		{
			this.app = app;
		}
		
		override public function destroy():void 
		{
			super.destroy();
			
			app 	= null;
			data 	= null;
		}
	}
}