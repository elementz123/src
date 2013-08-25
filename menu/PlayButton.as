package menu
{
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class PlayButton extends Sprite
	{
		//embed play button image here
		[Embed(source="../../assets/images/Button.jpg")]
		private var PlayImg:Class;
		private var outerBoxHover:Shape;
		private var outerBox:Shape;
		
		public function PlayButton()
		{
			var playBtn:DisplayObject = new PlayImg();
			playBtn.x = 245;
			playBtn.y = 215;
			addChild(playBtn);
			
			outerBox = new Shape();
			outerBox.graphics.lineStyle(6, 0xc0c0c0, 1);
			outerBox.graphics.drawRect(245, 215, 150, 60);
			addChild(outerBox);
			
			outerBoxHover = new Shape();
			outerBoxHover.graphics.lineStyle(6, 0xffff00, 1);
			outerBoxHover.graphics.drawRect(245, 215, 150, 60);
			addChild(outerBoxHover);
			
			outerBoxHover.visible = false;
			outerBox.visible = true;
			buttonMode = true;
			
			addEventListener(MouseEvent.MOUSE_OVER, onHover);
			addEventListener(MouseEvent.MOUSE_OUT, onNoHover);
		}
		
		private function onNoHover(e:MouseEvent):void
		{
			outerBoxHover.visible = false;
		}
		
		private function onHover(e:MouseEvent):void
		{
			outerBoxHover.visible = true;
		}
	}
}