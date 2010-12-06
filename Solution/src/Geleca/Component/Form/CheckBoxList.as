package Geleca.Component.Form 
{
	import flash.display.Sprite;
	import Geleca.Events.InputEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class CheckBoxList extends Input
	{
		private var _checks							:Vector.<CheckBox> = new Vector.<CheckBox>();
		
		public function CheckBoxList() 
		{
			super(new Sprite());
		}
		
		public function addCheck(check:CheckBox):void 
		{
			_checks.push(check);
		}
		
		public function get value():Vector.<String>
		{ 
			var values:Vector.<String> = new Vector.<String>();
			
			if (length == 0)
				return values;
			
			for (var i:int = 0; i < length; i++) 
			{
				if (_checks[i].checked)
					values.push(_checks[i].value);
			}
			
			return values;
		}
		
		public function get length():uint { return _checks.length; }
		
		public function checkAll():void 
		{
			for (var i:int = 0; i < length; i++) 
			{
				_checks[i].checked = true;
			}
		}
		
		public function uncheckAll():void 
		{
			for (var i:int = 0; i < length; i++) 
			{
				_checks[i].checked = false;
			}
		}
		
		override public function destroy():void 
		{
			var length	:uint = _checks.length;
			
			for (var i:int = 0; i < length; i++) 
			{
				_checks[i].destroy();
			}
			
			_checks = null;
			
			super.destroy();
		}
	}

}