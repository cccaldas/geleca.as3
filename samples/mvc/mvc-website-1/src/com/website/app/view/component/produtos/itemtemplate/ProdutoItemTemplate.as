package com.website.app.view.component.produtos.itemtemplate
{
	import caurina.transitions.Tweener;
	import com.geleca.as3.component.button.Button;
	import com.geleca.as3.component.data.ItemTemplate;
	import com.geleca.as3.effects.transition.FadeTransition;
	import com.geleca.as3.mvc.util.NavigateUtil;
	import com.geleca.as3.util.ContainerUtil;
	import com.website.app.App;
	import com.website.asset.produtos.itemtemplate.ProdutoItemTemplateAsset;
	import com.website.domain.entity.ProdutoEntity;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Cristiano Caldas
	 */
	public class ProdutoItemTemplate extends ItemTemplate
	{
		public var btn_thumb					:Button;
		
		public function ProdutoItemTemplate() 
		{
			
		}
		
		override protected function setup():void 
		{
			super.setup();
			
			this.alpha = 0;
			
			btn_thumb = addComponent(new Button(_asset)) as Button;
			
			btn_thumb.addEventListener(MouseEvent.CLICK, 		btn_thumb_click);
			btn_thumb.addEventListener(MouseEvent.ROLL_OVER, 	btn_thumb_rollOver);
			btn_thumb.addEventListener(MouseEvent.ROLL_OUT, 	btn_thumb_rollOut);
		}
		
		private function btn_thumb_click(e:MouseEvent):void 
		{
			App.getInstance().navigateURL("/produto/" + ProdutoEntity(dataSource).id.toString() + "/" + ProdutoEntity(dataSource).nome + "/");
		}
		
		override protected function bind():void 
		{
			super.bind();
			
			ProdutoItemTemplateAsset(_asset).txt_nome.text 	= ProdutoEntity(dataSource).nome;
			ProdutoItemTemplateAsset(_asset).txt_preco.text = "R$ " + ProdutoEntity(dataSource).preco;
			//ProdutoItemTemplateAsset(_asset).ctn_thumb.addChild(ProdutoEntity(dataSource).thumb.data);			
		}
		
		public function show():void 
		{
			FadeTransition.fadeIn(this, itemIndex * .1);
		}
		
		private function btn_thumb_rollOver(e:MouseEvent):void 
		{
			FadeTransition.fadeOut(btn_thumb, 0, .5);
		}
		
		private function btn_thumb_rollOut(e:MouseEvent):void 
		{
			FadeTransition.fadeIn(btn_thumb);
		}
		
		override public function destroy():void 
		{
			ContainerUtil.removeAllChilds(ProdutoItemTemplateAsset(_asset).ctn_thumb);
			
			Tweener.removeTweens(btn_thumb);
			btn_thumb = null;
			
			super.destroy();
		}
	}

}