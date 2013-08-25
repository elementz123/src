package visual 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123

	 */
	public class WinArea extends Sprite 
	{
		public function WinArea(width:int = 40,height:int = 40) 
		{
			graphics.lineStyle(0);
			graphics.beginFill(0x4227f2, 1);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}		
	}
}