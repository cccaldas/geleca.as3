package com.website.app.model 
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.data.entity.EntitySet;
	import com.geleca.as3.mvc.core.Model;
	import com.geleca.as3.mvc.core.MVCApp;
	import com.website.app.model.entity.ProdutoEntity;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutosModel extends Model
	{		
		public function ProdutosModel(app:MVCApp) 
		{
			super(app);
			
			var xml:XML = XML(app.loader.getItem("produtos.xml"));
			var list:List = new List();
			
			for (var i:int = 0; i < xml.produtos.produto.length(); i++) 
			{
				list.add(parse(xml.produtos.produto[i]));
			}
			
			this.data = list;
		}
		
		public function getProdutos():Vector.<ProdutoEntity>
		{
			return Vector.<ProdutoEntity>(List(data).items);
		}
		
		public function getProduto(id:uint):ProdutoEntity
		{
			return ProdutoEntity(List(data).where("id", "=", id).first());
		}
		
		private function parse(node:XML):ProdutoEntity
		{
			var produto:ProdutoEntity = new ProdutoEntity();
			
			produto.id = node.@id;
			produto.nome = node.@nome;
			produto.preco = node.@preco;
			
			return produto;
		}
		
	}

}