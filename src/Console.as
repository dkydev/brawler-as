package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Console {
		
		private static var _initialized:Boolean = false;		
		private static var _textfield:TextField;
		private static var _background:Bitmap;
		
		public static function initialize(stage:Stage):void {
			
			var width:Number = 400;
			
			_background 		= new Bitmap(new BitmapData(width + 10, stage.stageHeight, true, 0x64000000));
			_textfield 			= new TextField();
			_textfield.width 	= width;
			_textfield.height 	= stage.stageHeight;
			_textfield.defaultTextFormat = new TextFormat("_sans", 10, 0xffffff);
			_textfield.selectable = false;
			_textfield.mouseEnabled = false;
			
			_background.x 	= stage.stageWidth - width;
			_textfield.x 	= stage.stageWidth - width + 5;
			_textfield.y	= 2.5;
			
			_background.height = 0;
			
			stage.addChild(_background);
			stage.addChild(_textfield);
			
			_initialized = true;
			
			log("Console Initialized");
			
		}
		public static function clear():void {
			
			_textfield.text = "";
			_background.height = 0;
			
		}
		public static function log(...args):void {
			
			if (_initialized) {
				
				var text:String = _textfield.text;
				_textfield.text = "".concat(args, "\n", text);
				_background.height = _textfield.textHeight + 10;
				
			}
			
		}
	}
}