package com.geleca.as3.core
{
	import flash.display.Stage;

	public class GPUManager extends Object
	{		
		private var _stage						:Stage;
		
		private var _operations					:int = 0;
		
		private var _maxFPS						:uint = 1;
		private var _minFPS						:uint = 1;
	
		public function GPUManager(stage:Stage=null)
		{
			super();
			
			stage = stage;
		}
		
		public function get stage():Stage { return _stage; }
		
		public function set stage(value:Stage):void 
		{
			if (value != null)
			{
				_stage = value;
				
				maxFPS = _stage.frameRate;
			}
		}
		
		public function upFPS():void
		{
			_operations ++;
			stage.frameRate = maxFPS;
		}
		
		public function downFPS():void
		{
			_operations --;
			
			if (_operations < 0)
				_operations = 0;
			
			if(_operations == 0)
				stage.frameRate = minFPS;			
		}
		
		public function get maxFPS():uint { return _maxFPS; }
		public function set maxFPS(value:uint):void
		{
			_maxFPS = value;
		}
		
		public function get minFPS():uint { return _minFPS; }
		public function set minFPS(value:uint):void
		{
			_minFPS = value;
		}
	
	}

}