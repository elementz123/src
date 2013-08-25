package sound
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public final class SoundEffects
	{
		[Embed(source="../../assets/sounds/Powerup6.mp3")]
		private static var LevelWarp:Class;
		public static var levelWarp:Sound = new LevelWarp();
		public static var levelWarpChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "../../assets/sounds/Explosion5.mp3")]
		private static var Die:Class;
		public static var die:Sound = new Die();
		public static var dieChannel:SoundChannel = new SoundChannel();
		
		[Embed(source = "../../assets/sounds/Randomize29.mp3")]
		private static var TimeOut:Class;
		public static var timeOut:Sound = new TimeOut();
		public static var timeoutChannel:SoundChannel = new SoundChannel();
		
		[Embed(source="../../assets/sounds/Blip_Select80.mp3")]
		private static var Start:Class;
		public static var start:Sound = new Start();
		public static var startChannel:SoundChannel = new SoundChannel();
		
		public static var volumeAdjust:SoundTransform = new SoundTransform();
	}
}