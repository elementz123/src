package visual 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123

	 */
	public class Ball extends Sprite 
	{
		
		public function Ball() 
		{
			graphics.lineStyle(1);
			graphics.beginFill(0xffaa22);
			graphics.drawCircle(0, 0, 8);
			graphics.endFill();
		}
	}
}