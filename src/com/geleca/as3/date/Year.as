package com.geleca.as3.date
{

	public class Year extends Object
	{
		private var _date			:Date;
		private var _months			:Array;
	
		public function Year(year:int)
		{
			super();
			
			_date = new Date();
			_date.fullYear = year;
			
			_months = [];
			
			for (var i:int = 0; i < 12; i++)
				_months.push(new Month(i, year));
		}
		
		public function get months():Array { return _months; }
	
	}

}
