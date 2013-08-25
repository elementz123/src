package menu
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import gameMVC.GameModel;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class GameOverScreen extends Sprite
	{
		private var gameOverText:TextField;
		private var tFormat:TextFormat;
		private var playBtn:PlayButton = new PlayButton();
		
		public function GameOverScreen()
		{
			tFormat = new TextFormat();
			tFormat.bold = true;
			tFormat.size = 50;
			tFormat.color = 0xeeeeee;
			tFormat.align = TextFormatAlign.LEFT;
			
			gameOverText = new TextField();
			gameOverText.autoSize = TextFieldAutoSize.CENTER;
			gameOverText.text = "GAME OVER";
			gameOverText.setTextFormat(tFormat);
			gameOverText.x = 150;
			gameOverText.y = 200;
			addChild(gameOverText);
			playBtn.y = 50;
			addChild(playBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, onMenuClick);
		}
		
		private function onMenuClick(e:Event):void
		{
			Main.mainInstance.processMenu();
		}
	}
}