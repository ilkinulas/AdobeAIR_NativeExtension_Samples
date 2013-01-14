/**
 * Date: 1/13/13
 * Time: 10:21 PM
 */
package net.peakgames.mobile.air.anefacebook.sample {
import starling.events.Event;

public class ChangeScreenEvent extends Event{

    public static const CHANGE_SCREEN : String = "CHANGE_SCREEN";

    public function ChangeScreenEvent(type:String, bubbles:Boolean = false, data:Object = null) {
        super(type, bubbles, data);
    }
}
}
