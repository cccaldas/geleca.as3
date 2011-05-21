package Button.View
{
	import Button.Asset.ButtonTestAsset;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import Geleca.Component.Button.Button;
	import Geleca.Events.ButtonEvent;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ButtonTestView extends View
	{
		private var _asset				:ButtonTestAsset;
		
		public var btn_1				:Button;
		public var btn_2				:Button;
		public var btn_3				:Button;
		
		public function ButtonTestView() 
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_asset = new ButtonTestAsset();
			addChild(_asset);
			
			btn_1 = addComponent(new Button(_asset.btn_1)) as Button;
			btn_2 = addComponent(new Button(_asset.btn_2)) as Button;
			btn_3 = addComponent(new Button(_asset.btn_3)) as Button;
			
			btn_1.addEventListener(MouseEvent.CLICK, btn_1_click);
			btn_1.addEventListener(ButtonEvent.RELEASE_OUT_SIDE, btn_1_releaseOutSide);
		}
		
		private function btn_1_releaseOutSide(e:ButtonEvent):void 
		{
			trace(this, "btn_1_releaseOutSide");
		}
		
		private function btn_1_click(e:MouseEvent):void 
		{
			trace(this, "btn_1_click");
		}
		
	}

}