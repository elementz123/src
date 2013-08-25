package visual
{
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class PlayScreenBackground extends Shape
	{
		
		public function PlayScreenBackground()
		{
			graphics.lineStyle();
			graphics.beginFill(0x226244);
			graphics.drawRect(0, 0, 640, 480);
			graphics.endFill();
		}
	}
}