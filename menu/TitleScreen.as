package menu
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	
	public class TitleScreen extends Sprite
	{
		//embed background title image here
		[Embed(source="../../assets/images/MenuScreenLudumDare27.jpg")]
		private var TitlePic:Class;
		private var playBtn:PlayButton = new PlayButton();
		
		public function TitleScreen()
		{
			var titlePic:DisplayObject = new TitlePic();
			addChild(titlePic);
			playBtn.y = 20;
			addChild(playBtn);
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayClick);
		}
		
		private function onPlayClick(e:MouseEvent):void
		{
			Main.mainInstance.processPlay();
		}
	}
}