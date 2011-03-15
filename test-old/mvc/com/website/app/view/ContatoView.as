package com.website.app.view 
{
	import com.geleca.as3.mvc.core.View;
	import com.website.app.model.entity.ContatoEntity;
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
			
			app.postURL("/contato/send/", new ContatoEntity());
		}
		
		override public function action(act:String):void 
		{
			super.action(act);
			
			switch (act) 
			{
				case "send":
					action_send();
				break;
			}
		}
		
		private function action_send():void 
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