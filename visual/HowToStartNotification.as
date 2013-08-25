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
	public class HowToStartNotification extends Sprite
	{
		public var tf:TextField;
		public var format:TextFormat;
		
		public function HowToStartNotification() 
		{
			format = new TextFormat();
			format.bold = false;
			format.size = 30;
			format.color = 0xa5a511;
			format.align = TextFormatAlign.CENTER;
			
			tf = new TextField();
			tf.selectable = false;
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.x = 320;
			tf.y = 180;
			tf.text = "Press the Space bar to start." + "\n" +
			"Use arrow keys to control the ball." + "\n" +
			"Touch the blue area to advance to next level" + "\n" +
			"Earn 10 additional seconds each level" + "\n" +
			"Don't touch the walls or let the time run out!";
			tf.setTextFormat(format);
			addChild(tf);
		}		
	}
}