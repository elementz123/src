package menu
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class WinScreen extends Sprite
	{
		private var winText:TextField;
		private var tFormat:TextFormat;
		private var playBtn:RestartButton = new RestartButton();
		
		public function WinScreen() 
		{
			tFormat = new TextFormat();
			tFormat.bold = true;
			tFormat.size = 50;
			tFormat.color = 0xeeeeee;
			tFormat.align = TextFormatAlign.CENTER;
			
			winText = new TextField();
			winText.autoSize = TextFieldAutoSize.CENTER;
			winText.text = "You Win! \n Thanks for playing!";
			winText.setTextFormat(tFormat);
			winText.x = 110;
			winText.y = 140;
			addChild(winText);
			playBtn.y = 50;
			addChild(playBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, onMenuClick);
		}		
		
		private function onMenuClick(e:MouseEvent):void 
		{
			Main.mainInstance.processMenuFromWin();
		}
	}
}