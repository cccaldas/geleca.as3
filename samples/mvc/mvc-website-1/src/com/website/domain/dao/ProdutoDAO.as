package com.website.domain.dao
{
	import com.geleca.as3.collection.List;
	import com.geleca.as3.data.DAO;
	import com.geleca.as3.data.entity.AbstractFileEntity;
	import com.geleca.as3.data.entity.EntitySet;
	import com.geleca.as3.debugger.GLog;
	import com.website.app.App;
	import com.website.domain.entity.ProdutoEntity;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutoDAO extends DAO
	{	
		public function ProdutoDAO() 
		{
			if (produtos is List)
				return;
				
			var xml	:XML = XML(produtos);
			
			App.getInstance().context.add("produtos", new List());
			
			//GLog.log(xml, xml.produtos.produto.length());
			
			for (var i:int = 0; i < xml.produtos.produto.length(); i++) 
				List(produtos).add(parse(xml.produtos.produto[i]));
				
			//GLog.log(produtos.length);
		}
		
		public function getProdutos():Vector.<ProdutoEntity>
		{
			return Vector.<ProdutoEntity>(List(produtos).items);
		}
		
		public function getProduto(id:uint):ProdutoEntity
		{
			return ProdutoEntity(List(produtos).where("id", "=", id).firstOrDefault());
		}
		
		protected function get produtos():* { return App.getInstance().context.getByName("produtos"); }
		
		private function parse(node:XML):ProdutoEntity
		{
			var produto:ProdutoEntity = new ProdutoEntity();
			
			produto.id 			= node.@id;
			produto.nome 		= node.@nome;
			produto.preco 		= node.@preco;
			produto.thumb		= new AbstractFileEntity();
			produto.thumb.src 	= App.getInstance().config.getAppKey("path-produtos") + node.@id + ".jpg";
			
			return produto;
		}
		
	}

}