package visual 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author elementz123

	 */
	public class TimeDisplay extends Sprite 
	{
		public var tf:TextField;
		public var format:TextFormat;
		
		public function TimeDisplay() 
		{
			format = new TextFormat();
			format.bold = true;
			format.size = 30;
			format.color = 0xeeeeee;
			format.align = TextFormatAlign.LEFT;
			
			tf = new TextField();
			tf.selectable = false;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.x = 320;
			tf.text = "HELLO";
			tf.setTextFormat(format);
			addChild(tf);
		}		
	}
}