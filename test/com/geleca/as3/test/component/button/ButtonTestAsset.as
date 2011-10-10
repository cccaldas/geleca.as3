package com.geleca.as3.test.component.button
{
	import flash.display.Sprite;
	import com.geleca.as3.util.AlignUtil;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ButtonTestAsset extends Sprite
	{
		public var btn_1					:ButtonAsset = new ButtonAsset();
		public var btn_2					:ButtonAsset = new ButtonAsset();
		public var btn_3					:ButtonAsset = new ButtonAsset();
		
		public function ButtonTestAsset() 
		{
			super();
			
			addChild(btn_1);
			addChild(btn_2);
			addChild(btn_3);
			
			AlignUtil.distributeVertical([btn_1, btn_2, btn_3], 10);
		}
		
	}

}