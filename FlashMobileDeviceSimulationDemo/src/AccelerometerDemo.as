package
{
	import de.patrickheinzelmann.flash.sensors.Accelerometer;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.AccelerometerEvent;
	import flash.events.StatusEvent;
	import flash.sensors.Accelerometer;
	
	public class AccelerometerDemo extends Sprite
	{
		
		CONFIG::device
		public var acclerometer:flash.sensors.Accelerometer		
		
		CONFIG::adl
		public var acclerometer:de.patrickheinzelmann.flash.sensors.Accelerometer;
		
		public function AccelerometerDemo()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			initAccelerometer();
		}
		
		CONFIG::device
		public function initAccelerometer():void
		{
			if(flash.sensors.Accelerometer.isSupported){
				acclerometer = new flash.sensors.Accelerometer();
				if(acclerometer.muted){
					acclerometer.addEventListener(StatusEvent.STATUS, handleStatusChanged);
				}else{
					acclerometer.setRequestedUpdateInterval(10000);
					acclerometer.addEventListener(AccelerometerEvent.UPDATE, handleAccelerometerUpdate);
				}
			}
		}

		CONFIG::adl
		public function initAccelerometer():void
		{
			if(de.patrickheinzelmann.flash.sensors.Accelerometer.isSupported){
				acclerometer = new de.patrickheinzelmann.flash.sensors.Accelerometer();
				if(acclerometer.muted){
					acclerometer.addEventListener(StatusEvent.STATUS, handleStatusChanged);
				}else{
					acclerometer.setRequestedUpdateInterval(10000);
					acclerometer.addEventListener(AccelerometerEvent.UPDATE, handleAccelerometerUpdate);
				}
			}
		}
		
		public function handleStatusChanged(event:StatusEvent):void{
			if(!acclerometer.muted){
				acclerometer.setRequestedUpdateInterval(10000);
				acclerometer.addEventListener(AccelerometerEvent.UPDATE, handleAccelerometerUpdate);
			}else{
				acclerometer.removeEventListener(AccelerometerEvent.UPDATE, handleAccelerometerUpdate);
			}
		}
		
		public function handleAccelerometerUpdate(event:AccelerometerEvent):void{
			trace("Timestamp: "+event.timestamp
				+", Acceleration X: "+event.accelerationX
				+", Acceleration Y: "+event.accelerationY
				+", Acceleration Z: "+event.accelerationZ);
		}
	}
}