package {
	
	import dragonBones.Armature;
	import dragonBones.factorys.StarlingFactory;
	import dragonBones.objects.SkeletonData;
	import dragonBones.objects.XMLDataParser;
	import dragonBones.textures.StarlingTextureAtlas;
	import flash.display.Bitmap;
	import starling.textures.Texture;
	
	public class AssetManager {
		
		[Embed(source = "../res/graphics.png")]
		private static const GraphicsPNG:Class;		
		[Embed(source = "../res/graphics.xml", mimeType = "application/octet-stream")]
		private static const GraphicsXML:Class;
		[Embed(source = "../res/skeleton.xml", mimeType = "application/octet-stream")]
		private static const SkeletonXML:Class; 
		
		private static var _starlingFactory:StarlingFactory;		
		private static var _textureAtlas:StarlingTextureAtlas;
		
		public static function initialize():void {			
			
			_starlingFactory = new StarlingFactory();
			
			_textureAtlas = new StarlingTextureAtlas(Texture.fromBitmap(new GraphicsPNG() as Bitmap), XML(new GraphicsXML()));
			_starlingFactory.addTextureAtlas(_textureAtlas, "graphics");
			_starlingFactory.addSkeletonData(XMLDataParser.parseSkeletonData(XML(new SkeletonXML())));
			
		}
		public static function getArmature(armatureName:String):Armature {	
			return _starlingFactory.buildArmature(armatureName);			
		}		
		public static function get textureAtlas():StarlingTextureAtlas {
			return _textureAtlas;
		}
	}
}