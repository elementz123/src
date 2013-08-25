package
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author elementz123
	
	 */
	public class Preloader extends MovieClip
	{
		private var percentText:TextField;
		private var tFormat:TextFormat;
		
		public function Preloader()
		{
			if (stage)
			{
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO show loader
			tFormat = new TextFormat();
			tFormat.bold = true;
			tFormat.size = 20;
			tFormat.color = 0xcccccc;
			tFormat.align = TextFormatAlign.LEFT;
			
			percentText = new TextField();
			percentText.x = 260;
			percentText.y = 240;
			percentText.text = "9000";
			percentText.autoSize = TextFieldAutoSize.CENTER;
			percentText.setTextFormat(tFormat);
			addChild(percentText);
		}
		
		private function ioError(e:IOErrorEvent):void
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void
		{
			// TODO update loader
			var percentConversion:int = 
				(Math.floor(100 * loaderInfo.bytesLoaded / loaderInfo.bytesTotal));
			percentText.text = "Ludum Dare 27 entry loading: " +
				String(percentConversion + " percent loaded");
			percentText.setTextFormat(tFormat);
		}
		
		private function checkFrame(e:Event):void
		{
			if (currentFrame == totalFrames)
			{
				stop();
				loadingFinished();
			}
		}
		
		private function loadingFinished():void
		{
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO hide loader
			removeChild(percentText);
			percentText = null;
			startup();
		}
		
		private function startup():void
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild(new mainClass() as DisplayObject);
		}
	}
}