package com.website.app.view.component.produtos.itemtemplate
{
	import com.geleca.as3.component.data.ItemTemplate;
	import com.geleca.as3.effects.transition.FadeTransition;
	import com.geleca.as3.mvc.util.NavigateUtil;
	import com.website.app.model.entity.ProdutoEntity;
	import com.website.asset.produtos.itemtemplate.ProdutoItemTemplateAsset;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutoItemTemplate extends ItemTemplate
	{
		
		public function ProdutoItemTemplate() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			this.alpha = 0;
			
			_asset.buttonMode = true;
			_asset.addEventListener(MouseEvent.CLICK, asset_click);
		}
		
		private function asset_click(e:MouseEvent):void 
		{
			NavigateUtil.navigateURL("/produto/" + ProdutoEntity(dataSource).id.toString() + "/" + ProdutoEntity(dataSource).nome + "/");
		}
		
		override protected function bind():void 
		{
			super.bind();
			
			ProdutoItemTemplateAsset(_asset).txt_nome.text 	= ProdutoEntity(dataSource).nome;
			ProdutoItemTemplateAsset(_asset).txt_preco.text = "R$ " + ProdutoEntity(dataSource).preco;
			
			
		}
		
		public function show():void 
		{
			FadeTransition.fadeIn(this, itemIndex * .1);
		}
	}

}