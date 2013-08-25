package gameMVC
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import util.PixelPerfectCollisionDetection;
	import visual.*;
	
	/**
	 * ...Creates the main game loop. Responsible for logic for initialization, level setup,
	 * collision detection, and scoring. Also creates all objects used in game and adds them
	 * to the GameModel to be stored.
	 * @author elementz123
	
	 */
	public class GameController
	{
		private var gameModel:GameModel;
		private var _stage:Object;
		private var count:int;
		
		public function GameController(model:GameModel, stage:Object)
		{
			_stage = stage;
			gameModel = model;
			
			startLevel1();
		}
		
		public function processKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					gameModel.ballAx = -.1;
					break;
				case Keyboard.RIGHT:
					gameModel.ballAx = .1;
					break;
				case Keyboard.UP:
					gameModel.ballAy = -.1;
					break;
				case Keyboard.DOWN:
					gameModel.ballAy = .1;
			}
		}
		
		public function processKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					gameModel.ballAx = 0;
					break;
				case Keyboard.RIGHT:
					gameModel.ballAx = 0;
					break;
				case Keyboard.UP:
					gameModel.ballAy = 0;
					break;
				case Keyboard.DOWN:
					gameModel.ballAy = 0;
			}
		}
		
		private function startLevel1():void
		{
			gameModel.timeDisplay = new TimeDisplay();
			gameModel.totalMiliseconds = 10000; //10 seconds
			gameModel.startDate = new Date();
			
			gameModel.level1 = new Level1();
			gameModel.levelCounter = 1;
			gameModel.levelSelect = gameModel.level1;
			gameModel.winAreaSelect = gameModel.level1.winArea;
			
			gameModel.ball = new Ball();
			gameModel.ball.x = 100;
			gameModel.ball.y = 400;
			
			gameModel.playScreenBack = new PlayScreenBackground();
			
			gameModel.screen.addChild(gameModel.playScreenBack);
			gameModel.screen.addChild(gameModel.ball);
			gameModel.screen.addChild(gameModel.level1);
			gameModel.screen.addChild(gameModel.timeDisplay);
			
			_stage.addEventListener(Event.ENTER_FRAME, onEntFrame);
		}
		
		private function startLevel2():void
		{
			gameModel.totalMiliseconds += 10000;
			gameModel.level2 = new Level2();
			gameModel.levelSelect = gameModel.level2;
			gameModel.winAreaSelect = gameModel.level2.winArea;
			
			gameModel.ball.x = 200;
			gameModel.ball.y = 100;
			gameModel.resetBallPos();
			
			gameModel.screen.addChild(gameModel.level2);
			_stage.addEventListener(Event.ENTER_FRAME, onEntFrame);
		}
		
		private function onEntFrame(e:Event):void
		{
			gameModel.update();
			checkCollisions();
			gameModel.currentDate = new Date();
			gameModel.milisecondsToSubtract = gameModel.currentDate.getTime() - gameModel.startDate.getTime();
			gameModel.milisecondsLeft = gameModel.totalMiliseconds - gameModel.milisecondsToSubtract;
			//trace(gameModel.milisecondsLeft);
			gameModel.timeDisplay.tf.text = String(gameModel.milisecondsLeft) + " milliseconds left";
			gameModel.timeDisplay.tf.setTextFormat(gameModel.timeDisplay.format);
			if (gameModel.milisecondsLeft < 1)
			{
				endGame();
			}
		}
		
		private function checkCollisions():void
		{
			if (PixelPerfectCollisionDetection.isColliding(gameModel.ball,
				gameModel.winAreaSelect, gameModel.screen, true))
			{
				_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
				nextLevel();
			}
			else if (PixelPerfectCollisionDetection.isColliding(gameModel.ball,
				gameModel.levelSelect, gameModel.screen, true))
			{
				endGame();
			}
		}
		
		private function nextLevel():void
		{
			trace("win");
			gameModel.levelCounter += 1;
			
			if (gameModel.levelCounter == 2)
			{
				gameModel.screen.removeChild(gameModel.level1);
				gameModel.level1 = null;
				startLevel2();
			}
		}
		
		private function endGame():void
		{
			_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
			Main.mainInstance.processGameOver();
		}
	}
}