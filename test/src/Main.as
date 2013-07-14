package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.idream.pomelo.Data;
	
	/**
	 * ...
	 * @author Deo
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			var loader:URLLoader = new URLLoader(new URLRequest("role.json"));
			loader.addEventListener(Event.COMPLETE, function(e:Event):void {
				var string:String = loader.data;
				
				var data:Data = new Data(string);
				for each (var obj:Object in data.all())
				{
					for (var prop:* in obj) 
					{
						trace("[" + prop + "]: " + obj[prop]);
					}
					trace("----------------");
				}
			});
		}
		
	}
	
}