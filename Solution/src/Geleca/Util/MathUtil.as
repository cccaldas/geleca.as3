package Geleca.Util
{
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MathUtil 
	{
		
		public static function randRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
	}
	
}