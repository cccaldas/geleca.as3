package com.geleca.as3.display 
{
	import com.geleca.as3.util.AlignUtil;
	import com.geleca.as3.util.TextUtil;
	
	import flash.display.Sprite;
	import flash.text.TextFormat;

	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class HitArea extends RectangularSprite
	{		
		private var _txt_name					:SimpleTextField;
		
		public function HitArea(width:Number=1, height:Number=1, alpha:Number=0, fillColor:uint=0xffffff, name:String="", lineColor:uint=0x000000)
		{
			super(width, height, alpha, fillColor, true, lineColor, 0);
			
			mouseEnabled = mouseChildren = false;
			
			this.name = name;
			if(name != "")
			{
				_txt_name = new SimpleTextField();
				_txt_name.text = this.name;
				var tf:TextFormat = _txt_name.defaultTextFormat;
				tf.size = 15;
				TextUtil.updateTextFormat(_txt_name, tf, false);
				
				addChild(_txt_name);
				TextUtil.textWidthAndHeight(_txt_name);
				
				_txt_name.x = (width - _txt_name.width) * .5;
				_txt_name.y = (height - _txt_name.height) * .5; 
			}
		}
		
	}

}