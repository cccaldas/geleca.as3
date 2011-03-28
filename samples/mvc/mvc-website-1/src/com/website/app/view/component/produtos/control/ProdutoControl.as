package com.website.app.view.component.produtos.control 
{
	import com.geleca.as3.component.button.Button;
	import com.geleca.as3.component.Component;
	import com.geleca.as3.mvc.util.NavigateUtil;
	import com.website.asset.produtos.control.ProdutoControlAsset;
	import com.website.domain.entity.ProdutoEntity;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutoControl extends Component
	{
		public var btn_voltar					:Button;
		
		public function ProdutoControl(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			btn_voltar = addComponent(new Button(ProdutoControlAsset(_asset).btn_voltar)) as Button;
			btn_voltar.addEventListener(MouseEvent.CLICK, btn_voltar_click);
		}
		
		public function show():void 
		{
			visible = true;
		}
		
		public function hide():void 
		{
			visible = false;
		}
		
		public function set produto(value:ProdutoEntity):void 
		{
			ProdutoControlAsset(_asset).txt_nome.text 	= value.nome;
			ProdutoControlAsset(_asset).txt_preco.text 	= value.preco;
			ProdutoControlAsset(_asset).ctn_thumb.addChild(value.thumb.data);
		}
		
		private function btn_voltar_click(e:MouseEvent):void 
		{
			NavigateUtil.navigateURL("/produtos/");
		}
		
	}

}