package Asset.Contact 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	/**
	 * ...
	 * @author 
	 */
	public class ContactPageAsset extends Sprite
	{
		public var txt_name				:TextField = new TextField();
		public var txt_email			:TextField = new TextField();
		public var txt_phone			:TextField = new TextField();
		public var txt_company			:TextField = new TextField();
		
		public function ContactPageAsset() 
		{
			addChild(txt_name);
			addChild(txt_email).y = 15;
			addChild(txt_phone).y = 30;
			addChild(txt_company).y = 45;
			
			txt_name.text = "Name:";
			txt_email.text = "E-mail:";
			txt_phone.text = "Phone:";
			txt_company.text = "Company:";
		}
		
	}

}