/**
 * Date: 1/13/13
 * Time: 10:14 PM
 */
package net.peakgames.mobile.air.anefacebook.sample {
import com.freshplanet.ane.AirFacebook.Facebook;

import flash.html.script.Package;
import flash.sampler.getSavedThis;


import starling.display.Sprite;
import starling.events.Event;

public class FacebookApp extends Sprite {

    private var loginScreen : FacebookLoginScreen;
    private var profileScreen : FacebookProfileScreen;

    public function FacebookApp() {
        addEventListener(Event.ADDED_TO_STAGE, initialize);
        addEventListener(ChangeScreenEvent.CHANGE_SCREEN, handleScreenChange);
    }

    private function handleScreenChange(event:ChangeScreenEvent):void {
       switch (event.data.screen) {
           case "facebook_login":
               displayLoginScreen()
               break;
           case "facebook_display_profile":
               displayFacebookProfileScreen();
               break;
           default:
               break;
       }
    }

    private function initialize(event:Event):void {
        loginScreen = new FacebookLoginScreen();
        profileScreen = new FacebookProfileScreen();

        addChild(loginScreen);
        addChild(profileScreen);

        var facebook : Facebook = Facebook.getInstance();
        facebook.init(Constants.APP_ID);
        facebook.logEnabled = true;

        if (facebook.isSessionOpen) {
            this.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE_SCREEN, true, {screen:"facebook_display_profile"}));
        } else {
            this.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE_SCREEN, true, {screen:"facebook_login"}));
        }
    }

    private function displayLoginScreen():void {
        trace("Displaying facebook login screen...");
        this.profileScreen.visible = false;
        this.loginScreen.visible = true;
    }

    private function displayFacebookProfileScreen():void {
        trace("Displaying facebook profile screen...");
        this.profileScreen.visible = true;
        this.loginScreen.visible = false;
        this.profileScreen.fetchData();
    }

}
}
