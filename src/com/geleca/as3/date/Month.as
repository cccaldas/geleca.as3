package com.geleca.as3.date
{
	import flash.utils.Dictionary;
	import com.geleca.as3.i18n.LangEnum;

	public class Month extends Object
	{
		public static const JANUARY			:int = 0;
		public static const FEBRUARY		:int = 1;
		public static const MARCH			:int = 2;
		public static const APRIL			:int = 3;
		public static const MAY				:int = 4;
		public static const JUNE			:int = 5;
		public static const JULY			:int = 6;
		public static const AUGUST			:int = 7;
		public static const SEPTEMBER		:int = 8;
		public static const OCTOBER			:int = 9;
		public static const NOVEMBER		:int = 10;
		public static const DECEMBER		:int = 11;
		
		private var _month_names			:Dictionary;
		
		private var _month			:int;
		private var _year			:int;
		private var _date			:Date;
		private var _days			:int;
	
		public function Month(month:int, year:int)
		{
			super();
			
			_month 	= month;
			_year 	= year;
			_date 	= new Date();
			
			_date.month 	= _month;
			_date.fullYear 	= year;
			
			_days 		= 1;
			_date.date 	= 1;
			
			while(_date.month == _month)
			{
				_date.date = _days;
				_days ++;				
			}
			
			_days -=2;
			
			_date.month 	= _month;
			_date.date 		= 1;
			_date.fullYear 	= _year;
			
			_month_names = new Dictionary();			
			_month_names[LangEnum.PT_BR] = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
			_month_names[LangEnum.EN_US] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		}
		
		public function getName(lang:String="pt-br"):String
		{
			return _month_names[lang][_month];
		}
		
		public function get month()	:int { return _month; }
		public function get days()	:int { return _days; }
	
	}

}