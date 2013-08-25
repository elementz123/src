package visual
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class Level2 extends Sprite
	{
		[Embed(source="../../assets/images/Level2.png")]
		private var Back:Class;
		public var back:DisplayObject = new Back();
		
		public var winArea:WinArea;
		
		public function Level2()
		{
			winArea = new WinArea(50, 50);
			winArea.x = 100;
			winArea.y = 300;
			
			addChild(winArea);
			addChild(back);
		}
	}
}