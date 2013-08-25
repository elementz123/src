package gameMVC
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.text.TextField;
	import flash.utils.Timer;
	import visual.*;
	
	/**
	 * ...All game data is stored here.
	 * @author elementz123
	
	 */
	public class GameModel extends EventDispatcher
	{
		//game play screen
		public var screen:Sprite = new Sprite();
		//background
		public var playScreenBack:PlayScreenBackground;
		public var howToStart:HowToStartNotification;
		//ball vars
		public var ball:Ball;
		public var ballVx:Number = 0;
		public var ballVy:Number = 0;
		public var ballAx:Number = 0;
		public var ballAy:Number = 0;
		//levels
		public var levelCounter:int = 0;
		public var levelSelect:DisplayObject;
		public var winArea:WinArea;
		public var level1:Level1;
		public var level2:Level2;
		public var level3:Level3;
		public var level4:Level4;
		public var started:Boolean = false;
		//time vars
		public var startDate:Date;
		public var currentDate:Date;
		public var totalMiliseconds:int = 0;
		public var milisecondsToSubtract:int = 0;
		public var milisecondsLeft:int = 0;
		public var timeDisplay:TimeDisplay;
		public var seconds:int = 0;
		public var hundreth:int = 0;
		public var timeString:String;
		
		
		
		public function GameModel()
		{
		
		}
		
		public function update():void
		{
			ballVx += ballAx;
			ballVy += ballAy;
			ball.x += ballVx;
			ball.y += ballVy;
		}
		
		public function resetBallPos():void
		{
			ballAy = 0;
			ballAx = 0;
			ballVx = 0;
			ballVy = 0;
		}
		
		public function calculateTimeLeft():void
		{	
			currentDate = new Date();
			milisecondsToSubtract = currentDate.getTime() - startDate.getTime();
			milisecondsLeft = totalMiliseconds - milisecondsToSubtract;
			//trace(gameModel.milisecondsLeft);
			
			seconds = Math.floor(milisecondsLeft / 1000);
			hundreth = Math.floor(milisecondsLeft / 10 - seconds * 100);
			timeString = String(seconds) + "." + String(hundreth);
		}
		
		public function showTime():void
		{
			timeDisplay.tf.text = timeString;
			timeDisplay.tf.setTextFormat(timeDisplay.format);
		}
	}
}