package
{
	import de.patrickheinzelmann.flash.sensors.Geolocation;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.GeolocationEvent;
	import flash.events.StatusEvent;
	import flash.sensors.Geolocation;
	
	public class GeolocationDemo extends Sprite
	{
		
		CONFIG::device
		public var geolocation:flash.sensors.Geolocation		
		
		CONFIG::adl
		public var geolocation:de.patrickheinzelmann.flash.sensors.Geolocation;
		
		public function GeolocationDemo()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			initGeolocation();
		}
		
		CONFIG::device
		public function initGeolocation():void
		{
			if(flash.sensors.Geolocation.isSupported){
				geolocation = new flash.sensors.Geolocation();
				if(geolocation.muted){
					geolocation.addEventListener(StatusEvent.STATUS, handleStatusChanged);
				}else{
					geolocation.setRequestedUpdateInterval(10000);
					geolocation.addEventListener(GeolocationEvent.UPDATE, handleGeolocationUpdate);
				}
			}
		}
		
		CONFIG::adl
		public function initGeolocation():void
		{
			if(de.patrickheinzelmann.flash.sensors.Geolocation.isSupported){
				geolocation = new de.patrickheinzelmann.flash.sensors.Geolocation();
				if(geolocation.muted){
					geolocation.addEventListener(StatusEvent.STATUS, handleStatusChanged);
				}else{
					geolocation.setRequestedUpdateInterval(4000);
					geolocation.addEventListener(GeolocationEvent.UPDATE, handleGeolocationUpdate);
				}
			}
		}
		
		public function handleStatusChanged(event:StatusEvent):void{
			if(!geolocation.muted){
				geolocation.setRequestedUpdateInterval(10000);
				geolocation.addEventListener(GeolocationEvent.UPDATE, handleGeolocationUpdate);
			}else{
				geolocation.removeEventListener(GeolocationEvent.UPDATE, handleGeolocationUpdate);
			}
		}
		
		public function handleGeolocationUpdate(event:GeolocationEvent):void{
			trace("Timestamp: "+event.timestamp
				+", Longitude: "+event.longitude
				+", Latitude: "+event.latitude
				+", Horizontal Accuracy: "+event.horizontalAccuracy
				+", Vertical Accuracy: "+event.verticalAccuracy
				+", Altitude: "+event.altitude
				+", Heading: "+event.heading
				+", Speed: "+event.speed);
		}
	}
}