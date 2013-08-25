package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.ui.Mouse;
	import menu.*;
	import gameMVC.*;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	[Frame(factoryClass="Preloader")]
	[SWF(backgroundColor="0x141414",frameRate="60",width="640",height="480")]
	
	public class Main extends Sprite
	{
		private static var _mainInstance:Object;
		
		private var gameModel:GameModel;
		private var gameController:GameController;
		private var gameView:GameView;
		private var _titleScreen:TitleScreen;
		private var _gameOverScreen:GameOverScreen;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_mainInstance = this;
			_titleScreen = new TitleScreen();
			addChild(_titleScreen);
		}
		
		public function processPlay():void
		{
			stage.focus = gameView;
			Mouse.hide();
			gameModel = new GameModel();
			gameController = new GameController(gameModel, stage);
			gameView = new GameView(gameModel, gameController, stage);
			addChild(gameView);
			
			removeChild(_titleScreen);
			_titleScreen = null;
		}
		
		public function processGameOver():void
		{
			Mouse.show();
			_gameOverScreen = new GameOverScreen();
			addChild(_gameOverScreen);
			
			removeChild(gameView);
			gameModel = null;
			gameController = null;
			gameView = null;
		}
		
		public function processMenu():void
		{
			Mouse.show();
			_titleScreen = new TitleScreen();
			addChild(_titleScreen);
			
			removeChild(_gameOverScreen);
			_gameOverScreen = null;
		}
		
		static public function get mainInstance():Object
		{
			return _mainInstance;
		}
	}
}