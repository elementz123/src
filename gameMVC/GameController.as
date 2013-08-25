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
			
			gameModel.playScreenBack = new PlayScreenBackground();
			gameModel.timeDisplay = new TimeDisplay();
			gameModel.howToStart = new HowToStartNotification();
			gameModel.winArea = new WinArea();
			gameModel.screen.addChild(gameModel.playScreenBack);
			gameModel.screen.addChild(gameModel.winArea);
			initLevel1();
		}
		
		private function startTheLevel():void
		{
			gameModel.started = true;
			gameModel.startDate = new Date();
			gameModel.totalMiliseconds = gameModel.milisecondsLeft;
			_stage.addEventListener(Event.ENTER_FRAME, onEntFrame);
			gameModel.howToStart.visible = false;
		}
		
		private function initLevel1():void
		{
			gameModel.totalMiliseconds = 10000; //10 seconds
			gameModel.startDate = new Date();
			gameModel.calculateTimeLeft();
			gameModel.showTime();
			
			gameModel.level1 = new Level1();
			gameModel.levelCounter = 1;
			gameModel.levelSelect = gameModel.level1;
			
			gameModel.winArea.x = 120;
			gameModel.winArea.y = 120;
			
			gameModel.ball = new Ball();
			gameModel.ball.x = 100;
			gameModel.ball.y = 400;
			
			gameModel.screen.addChild(gameModel.ball);
			gameModel.screen.addChild(gameModel.level1);
			gameModel.screen.addChild(gameModel.timeDisplay);
			gameModel.screen.addChild(gameModel.howToStart);
		}
		
		private function initLevel2():void
		{
			gameModel.level2 = new Level2();
			gameModel.levelSelect = gameModel.level2;
			
			gameModel.ball.x = 540;
			gameModel.ball.y = 230;
			gameModel.resetBallPos();
			
			gameModel.winArea.x = 55;
			gameModel.winArea.y = 370;
			
			gameModel.screen.addChild(gameModel.level2);
			gameModel.screen.addChild(gameModel.timeDisplay);
			gameModel.screen.addChild(gameModel.howToStart);
		}
		
		private function initLevel3():void
		{
			gameModel.level3 = new Level3();
			gameModel.levelSelect = gameModel.level3;
			
			gameModel.ball.x = 200;
			gameModel.ball.y = 100;
			gameModel.resetBallPos();
			
			gameModel.winArea.x = 70;
			gameModel.winArea.y = 240;
			
			gameModel.screen.addChild(gameModel.level3);
			gameModel.screen.addChild(gameModel.timeDisplay);
			gameModel.screen.addChild(gameModel.howToStart);
		}
		
		private function onEntFrame(e:Event):void
		{
			gameModel.update();
			gameModel.calculateTimeLeft();
			gameModel.showTime();
			checkCollisions();
			
			if (gameModel.milisecondsLeft < 1)
			{
				trace("out of time");
				endGame();
			}
		}
		
		private function checkCollisions():void
		{
			if (PixelPerfectCollisionDetection.isColliding(gameModel.ball,
				gameModel.winArea, gameModel.screen, false))
			{
				trace("win");
				_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
				if (gameModel.levelCounter == 3)
				{
					winGame();
				}
				nextLevel();
			}
			if (PixelPerfectCollisionDetection.isColliding(gameModel.ball,
				gameModel.levelSelect, gameModel.screen, true))
			{
				trace("hit");
				endGame();
			}
		}
		
		private function nextLevel():void
		{
			gameModel.levelCounter += 1;
			gameModel.totalMiliseconds += 10000;
			
			gameModel.started = false;
			_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
			gameModel.calculateTimeLeft();
			gameModel.showTime();
			gameModel.screen.addChild(gameModel.timeDisplay);
			gameModel.howToStart.visible = true;
			
			if (gameModel.levelCounter == 2)
			{
				gameModel.screen.removeChild(gameModel.level1);
				gameModel.level1 = null;
				initLevel2();
			}
			
			if (gameModel.levelCounter == 3)
			{
				gameModel.screen.removeChild(gameModel.level2);
				gameModel.level2 = null;
				initLevel3();
			}
		}
		
		private function endGame():void
		{
			_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
			Main.mainInstance.processGameOver();
		}
		
		private function winGame():void
		{
			_stage.removeEventListener(Event.ENTER_FRAME, onEntFrame);
			Main.mainInstance.processWinGame();
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
			
			if (e.keyCode == Keyboard.SPACE && !gameModel.started)
			{
				startTheLevel();
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
	}
}