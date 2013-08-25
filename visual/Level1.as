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
		[Embed(source="../../assets/images/Level1actual.png")]
		private var Back:Class;
		public var back:DisplayObject = new Back();
		
		public function Level1() 
		{
			addChild(back);
		}		
	}
}