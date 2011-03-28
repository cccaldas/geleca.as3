package com.website.app.view 
{
	import com.geleca.as3.component.data.DataList;
	import com.geleca.as3.debugger.GLog;
	import com.geleca.as3.effects.transition.FadeTransition;
	import com.geleca.as3.mvc.core.View;
	import com.geleca.as3.loading.AssetLoaderItem;
	import com.geleca.as3.util.FunctionUtil;
	import com.website.app.view.component.produtos.control.ProdutoControl;
	import com.website.app.view.component.produtos.control.ProdutosControl;
	import com.website.app.view.component.produtos.itemtemplate.ProdutoItemTemplate;
	import com.website.asset.produtos.view.ProdutosViewAsset;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutosView extends View 
	{
		private var _asset					:Sprite;
		
		public var ctr_produtos				:ProdutosControl;
		public var ctr_produto				:ProdutoControl;
		
		public function ProdutosView() 
		{
			
		}
		
		override public function load():void 
		{
			addLoaderItem(new AssetLoaderItem("asset", app.config.getAppKey("path-asset") + "produtos.swf"));
			
			super.load();			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			_asset = new ProdutosViewAsset();
			addChild(_asset);
			
			ctr_produtos 	= addComponent(new ProdutosControl(ProdutosViewAsset(_asset).ctr_produtos)) as ProdutosControl;
			ctr_produto 	= addComponent(new ProdutoControl(ProdutosViewAsset(_asset).ctr_produto)) as ProdutoControl;
			
			//this.alpha = 0;
		}
		
		override public function show(onComplete:Function = null):void 
		{
			super.show(onComplete);
		}
		
		override public function hide(onComplete:Function = null):void 
		{
			FunctionUtil.functionDelay(onComplete, 1);
		}
		
		//Actions
		public function index():void 
		{
			ctr_produtos.produtos = viewData["produtos"];
			
			ctr_produto.hide();
			ctr_produtos.show();
			
			//GLog.log(viewData["produtos"]);
		}
		
		public function produto():void
		{
			ctr_produto.produto = viewData["produto"];
			
			ctr_produtos.hide();
			ctr_produto.show();
			
			//GLog.log(viewData["produto"]);
		}
		
	}

}