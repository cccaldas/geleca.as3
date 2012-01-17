package com.geleca.as3.date
{
	import com.geleca.as3.util.DateUtil;

	public class DateTime extends Object
	{
		private var _date				:Date;
	
		public function DateTime(date:Date=null)
		{
			super();
			
			_date = date;
			
			if(!_date)
				_date = new Date();
		}
		
		public function get day():int { return _date.date; }
		public function set day(value:int):void
		{
			_date.date = value;
		}
		
		public function get time():Number { return _date.time; }
		public function set time(value:Number):void
		{
			_date.time = value;
		}	
		
		public function get hours():int { return _date.hours; }
		public function set hours(value:int):void
		{
			_date.hours = value;
		}
		
		public function get month():int { return _date.month; }
		public function set month(value:int):void
		{
			_date.month = value;
		}
		public function get fullMonth():Month { return new Month(month, year); }
		
		public function get year():int { return _date.fullYear; }
		public function set year(value:int):void
		{
			_date.fullYear = value;
		}
		public function get fullYear():Year { return new Year(year); }
		
		public static function get now():DateTime
		{
			return new DateTime();
		}
		
		public function toString(format:String="mm/dd/yyyy"):String
		{
			return DateUtil.toString(_date, format);
		}
		
		public static function convertMillisecondsToHours(milliseconds:int):int
		{
			return Math.round(milliseconds / (60*60*1000));
		}
	
	}

}