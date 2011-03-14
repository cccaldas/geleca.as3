package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import Geleca.Effects.Transition.FadeTransition;
	import Geleca.Util.ObjectUtil;
	import Geleca.Util.TextUtil;
	import Geleca.View.Loading.AssetLoaderItem;
	import Geleca.View.View;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class MainView extends View
	{
		private var _asset				:Sprite;
		
		public function MainView() 
		{
			this.initializeView();
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			addLoaderItem(new AssetLoaderItem("asset", "../asset/swc/Assets.swf"));
		}
		
		override protected function initialize():void 
		{
			super.initialize();
			
			_asset = ObjectUtil.getObjectByClassName("MainViewAsset");
			addChild(_asset);
			
			/*var txt:TextField = new TextField();
			addChild(txt);*/
			var txt:TextField = _asset.getChildByName("txt_label") as TextField;
			trace(this, "value", txt.text);
			TextEmbedUtil.createTextfield(txt);
			txt = _asset.getChildByName("txt_label") as TextField;
			trace(this, "value", txt.text);
			
			//TextUtil.updateTextFormat(txt, txt.defaultTextFormat);
			/*var tf:TextFormat = txt.defaultTextFormat;
			tf.font = new Font1().fontName;*/
			trace(this, "embed", new Font1().fontName, new Font1().fontName == txt.defaultTextFormat.font);
			
			//TextUtil.updateTextFormat(txt, tf);
			trace(this, txt.defaultTextFormat.font);
			txt.text = "Teste Label";
			
			FadeTransition.fadeOut(this, 0, 0, .7, hide_complete);
			
			function hide_complete():void 
			{
				trace("hide_complete");
			}
		}
		
	}

}