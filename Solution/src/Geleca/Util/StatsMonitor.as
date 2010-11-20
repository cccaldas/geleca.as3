package Geleca.Util
{
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	
	public class StatsMonitor extends Sprite
	{
		private var _mem				:Number = 0;
		private var _timer				:Number = 0;
		private var _ms_prev			:Number = 0
		private var _fps				:uint = 0;
		
		private var txt_report			:TextField = new TextField();
		
		public function StatsMonitor() 
		{
			this.blendMode = BlendMode.INVERT;
			addChild(txt_report);
			txt_report.autoSize = TextFieldAutoSize.LEFT;
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";
			tf.size = 10;
			txt_report.defaultTextFormat = tf;
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(Event.ENTER_FRAME, enter_frame);
		}
		
		private function enter_frame(e:Event):void 
		{
			_timer = getTimer();
			
			if (_timer - 1000 > _ms_prev)
			{
				_ms_prev = _timer;
				_mem = Number((System.totalMemory * 0.000000954).toFixed(3));	
				
				txt_report.text = "";
				txt_report.appendText("FPS: " + _fps + "/" + stage.frameRate.toString() + ", ");
				txt_report.appendText("Memory: " + _mem.toString() + "mb , ");
				txt_report.appendText("StageWidth: " + stage.stageWidth + "px , ");
				txt_report.appendText("StageHeight: " + stage.stageHeight + "px , ");
				
				_fps = 0;
			}

			_fps++;
			
			
		}
		
	}

}