package visual
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class Level3 extends Sprite
	{
		[Embed(source="../../assets/images/Level2actual.png")]
		private var Back:Class;
		public var back:DisplayObject = new Back();
		
		public function Level3() 
		{
			addChild(back);
		}		
	}
}