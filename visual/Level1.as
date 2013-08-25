package visual 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123

	 */
	public class Level1 extends Sprite 
	{
		[Embed(source="../../assets/images/Level1.png")]
		private var Back:Class;
		public var back:DisplayObject = new Back();
		
		public var winArea:WinArea;
		
		public function Level1() 
		{
			winArea = new WinArea(115, 115);
			winArea.x = 90;
			winArea.y = 90;
			
			addChild(winArea);
			addChild(back);
		}		
	}
}