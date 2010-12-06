package Geleca.Type 
{
	import com.adobe.utils.NumberFormatter;
	import com.adobe.utils.StringUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class Currency extends Object
	{
		private var _value                :Number = 0;
		private var _currency             :String = null;
		private var _decimalSeparator     :String = null;
		private var _thousandsSeparator   :String = null;
		
		/**
		 * @param value Valor em moeda, ex: 2003.56
		 * */
		public function Currency(value:Number, currency:String = "R$ ", decimalSeparator:String = ",",thousandsSeparator:String=".") 
		{
			//value                 = StringUtil.replace(value, ".", ",");
			_value                = value;
			_currency             = currency;
			_decimalSeparator     = decimalSeparator;
			_thousandsSeparator   = thousandsSeparator;
			
			//trace(toString());
		}
		
		public function toString():String
		{
			var _return:String;
			
			_return = currency(_value, 2, _currency);
			_return = StringUtil.replace(_return, ",", "-");
			_return = StringUtil.replace(_return, ".", _decimalSeparator);
			_return = StringUtil.replace(_return, "-", _thousandsSeparator);
			
			return _return;
		}
		
		
		private function currency(num:Number, decimalPlace:Number = 2, currency:String = "$"):String
        {
            //assigns true boolean value to neg in number less than 0
            var neg:Boolean = (num < 0);
            
            //make the number positive for easy conversion
            num = Math.abs(num)

            var roundedAmount:String = String(num.toFixed(decimalPlace));
            
            //split string into array for dollars and cents
            var amountArray:Array = roundedAmount.split(".");
            var dollars:String = amountArray[0]
            var cents:String = amountArray[1]
            
            //create dollar amount
            var dollarFinal:String = ""
            var i:int = 0
            for (i; i < dollars.length; i++)
            {
                if (i > 0 && (i % 3 == 0 ))
                {
                    dollarFinal = "," + dollarFinal;
                }
                
                dollarFinal = dollars.substr( -i -1, 1) + dollarFinal;
            }   
            
            //create Cents amount and zeros if necessary
            var centsFinal:String = String(cents);
            
            var missingZeros:int = decimalPlace - centsFinal.length;
        
            if (centsFinal.length < decimalPlace)
            {
                for (var j:int = 0; j < missingZeros; j++) 
                {
                    centsFinal += "0";
                }
            }
            
            var finalString:String = ""

            if (neg)
            {
                finalString = "-"+currency + dollarFinal
            } else
            {
                finalString = currency + dollarFinal
            }

            if(decimalPlace > 0)
            {
                finalString += "." + centsFinal;
            } 
            
            return finalString;
        }
		
		
	}

}