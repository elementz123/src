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
		private var timeLeftWords:TextField;
		public var format:TextFormat;
		
		public function TimeDisplay() 
		{
			format = new TextFormat();
			format.bold = false;
			format.size = 30;
			format.color = 0xeeeeee;
			format.align = TextFormatAlign.LEFT;
			
			tf = new TextField();
			tf.selectable = false;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.x = 320;
			tf.y = 30;
			tf.text = "HELLO";
			tf.setTextFormat(format);
			addChild(tf);
			
			timeLeftWords = new TextField();
			timeLeftWords.selectable = false;
			timeLeftWords.autoSize = TextFieldAutoSize.CENTER;
			timeLeftWords.x = 320;
			timeLeftWords.y = 0;
			timeLeftWords.text = "Seconds Remaining";
			timeLeftWords.setTextFormat(format);
			addChild(timeLeftWords);
		}		
	}
}