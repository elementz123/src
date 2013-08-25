package visual 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author elementz123

	 */
	public class Level4 extends Sprite 
	{
		[Embed(source="../../assets/images/Level2.png")]
		private var Back:Class;
		public var back:DisplayObject = new Back();
		
		public function Level4() 
		{
			addChild(back);
		}		
	}
}