package com.website.app.view 
{
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.util.FunctionUtil;
	import com.website.app.App;
	import com.website.domain.entity.ContatoEntity;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ContatoView extends View
	{
		private var txt:TextField;
		
		public function ContatoView() 
		{
			
		}
		
		override public function load():void 
		{
			GLog.log("");
			
			super.load();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			txt = new TextField();
			txt.text = "CONTATO";
			addChild(txt);
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			//App.getInstance().postURL("/contato/send/", new ContatoEntity());
		}
		
		override public function show(onComplete:Function = null):void 
		{
			GLog.log("");
			
			FunctionUtil.functionDelay(onComplete, 1);
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			FunctionUtil.functionDelay(onComplete, 1);
		}
		
		public function index():void 
		{
			
		}
		
		public function send():void 
		{
			switch (viewData["status"]) 
			{
				case "sent":
					txt.text = "sent";
				break;
				
				case "error":
					txt.text = "error";
				break;
			}
		}
	}

}