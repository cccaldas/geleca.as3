package Geleca.Component.Form
{
	import flash.display.Sprite;
	import Geleca.Component.Component;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Input extends Component
	{
		private var _valid					:Boolean = true;
		
		public function Input(asset:Sprite) 
		{
			super(asset);
		}
		
		public function get valid():Boolean { return _valid; }
		
		public function set valid(value:Boolean):void 
		{
			if (_valid != value)
			{
				_valid = value;
				if (value) status_valid();
				else status_invalid();
			}
		}
		
		protected function status_valid():void 
		{
			
		}
		
		protected function status_invalid():void 
		{
			
		}
		
	}

}