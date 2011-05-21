package  
{
	import flash.text.TextField;
	import Geleca.Util.TextUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TextEmbedUtil
	{
		
		public function TextEmbedUtil() 
		{
			
		}
		
		public static function createTextfield(target:TextField, embedFonts:Boolean=true):void 
		{
			var txt:TextField = new TextField();
			txt.type = target.type;
			txt.transform = target.transform;
			txt.x = target.x;
			txt.y = target.y;
			
			TextUtil.updateTextFormat(txt, target.defaultTextFormat, embedFonts);
			txt.name = target.name;
			target.parent[target.name] = txt;
			target.parent.addChild(txt);
			target.parent.removeChild(target);
		}
		
	}

}