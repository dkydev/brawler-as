package engine.component.render {
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class ImageRenderable extends RenderComponent {
		
		public function ImageRenderable(imageId:String, pivotX:Number = 0, pivotY:Number = 0) {
			
			super();
			
			container 	= new Sprite();
			graphic 	= new Sprite();
			image 		= new Image(AssetManager.textureAtlas.getTexture(imageId));
			shadow 		= new Image(AssetManager.textureAtlas.getTexture("shadow"));
			
			image.pivotX = pivotX
			image.pivotY = pivotY;
			
			shadow.pivotX = pivotX + shadow.width * 0.5;
			
			graphic.addChild(image);
			container.addChild(graphic);
			
		}		
	}
}