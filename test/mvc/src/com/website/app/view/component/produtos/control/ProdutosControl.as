package com.website.app.view.component.produtos.control 
{
	import com.geleca.as3.component.Component;
	import com.geleca.as3.component.data.DataList;
	import com.website.app.model.entity.ProdutoEntity;
	import com.website.app.view.component.produtos.itemtemplate.ProdutoItemTemplate;
	import com.website.asset.produtos.control.ProdutosControlAsset;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutosControl extends Component
	{
		public var dlst_produtos			:DataList;
		
		
		public function ProdutosControl(asset:Sprite) 
		{
			super(asset);
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			dlst_produtos = addComponent(new DataList(ProdutosControlAsset(_asset).dlst_produtos, ProdutoItemTemplate)) as DataList;
		}
		
		public function show():void 
		{
			visible = true;
		}
		
		public function hide():void 
		{
			visible = false;
		}
		
		public function set produtos(value:Vector.<ProdutoEntity>):void 
		{
			dlst_produtos.clear();
			dlst_produtos.dataSource = value;
			dlst_produtos.dataBind();
			
			//FadeTransition.fadeIn(this);
			for (var i:int = 0; i < dlst_produtos.length; i++) 
			{
				ProdutoItemTemplate(dlst_produtos.getItemAt(i)).show();
			}
		}
		
	}

}