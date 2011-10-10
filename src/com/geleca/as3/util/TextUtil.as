package com.geleca.as3.util
{
	import com.adobe.utils.StringUtil;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class TextUtil
	{
		
		public function TextUtil() 
		{
			super();
		}
		
		public static function resumeText(text:String, length:int, endText:String="..."):String 
		{
			return (text.length > length) ? String(text.substring(0, length) + endText) : text;
		}
		
		
		/**
		*	Função que substitui caracteres especiais em caracteres comuns
		*/	
		public static function replaceSpecialCaracters(text:String):String
		{
			text = StringUtil.replace(text, "ç", "c");
			text = StringUtil.replace(text, "ã", "a");
			text = StringUtil.replace(text, "á", "a");
			text = StringUtil.replace(text, "à", "a");
			text = StringUtil.replace(text, "â", "a");
			text = StringUtil.replace(text, "ä", "a");
			
			text = StringUtil.replace(text, "é", "e");
			text = StringUtil.replace(text, "è", "e");
			text = StringUtil.replace(text, "ê", "e");
			
			text = StringUtil.replace(text, "í", "i");
			text = StringUtil.replace(text, "ì", "i");
			text = StringUtil.replace(text, "î", "i");
			
			text = StringUtil.replace(text, "ó", "o");
			text = StringUtil.replace(text, "ò", "o");
			text = StringUtil.replace(text, "õ", "o");
			text = StringUtil.replace(text, "ô", "o");
			
			text = StringUtil.replace(text, "ú", "u");
			text = StringUtil.replace(text, "ù", "u");
			text = StringUtil.replace(text, "û", "u");
			return text;
		}
		
		public static function removeWhiteSpaces(text:String,replacement:String=""):String
		{
			if (replacement == "") 
			{
				return StringUtil.replace(text, " ", "");
			}
			else 
			{
				return StringUtil.replace(text, " ", replacement);
			}
			
		}
		
		/**Formata o texto removendo os espaços e caracteres especiais.*/
		public static function formatURL(text:String):String
		{
			text = replaceSpecialCaracters(text);
			text = removeWhiteSpaces(text,"-");
			
			return text.toLowerCase();
		}
		
		public static function updateTextFormat(target:TextField, format:TextFormat, embedFonts:Boolean=true, antiAlias:String="advanced"):void 
		{
			target.antiAliasType 		= antiAlias;
			target.embedFonts 			= embedFonts;
			target.defaultTextFormat 	= format;
			target.text 				= target.text;
		}
		
		public static function textHeight(target:TextField):void 
		{
			target.height = (target.getLineMetrics(0).height * .5) + target.textHeight;
		}
		
		public static function textWidth(target:TextField):void 
		{
			target.height = (target.getLineMetrics(0).width * .5) + target.textWidth;
		}
		
		public static function textWidthAndHeight(target:TextField):void
		{
			textWidth(target);
			textHeight(target);
		}
		
	}
	
}