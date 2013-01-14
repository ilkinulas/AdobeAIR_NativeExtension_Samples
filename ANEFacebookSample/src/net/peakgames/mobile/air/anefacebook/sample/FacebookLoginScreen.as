package net.peakgames.mobile.air.anefacebook.sample {


import com.freshplanet.ane.AirFacebook.Facebook;

import starling.display.Button;
import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;

public class FacebookLoginScreen extends Sprite {
    private var loginButton:Button;
    private var nameTextField:TextField;
    private var surnameTextField:TextField;

    [Embed(source="../../../../../../../media/f-connect.png")]
    private var FBLoginButtonAsset:Class;

    public function FacebookLoginScreen () {
        addEventListener(Event.ADDED_TO_STAGE, initialize);
    }

    private function initialize(event:Event):void {
        var screenWidth : Number  = stage.stageWidth;
        var screenHeight : Number = stage.stageHeight;
        trace("Screen width : " + screenWidth + ", screen height : " + screenHeight);

        loginButton = new Button(Texture.fromBitmap(new FBLoginButtonAsset()));
        loginButton.x = (screenWidth - loginButton.width) / 2;
        loginButton.y = (screenHeight - loginButton.height) / 2;

        loginButton.addEventListener(Event.TRIGGERED, onLoginButtonClicked);
        addChild(loginButton);
    }

    private function onLoginButtonClicked(event:Event):void {
        var facebook : Facebook = Facebook.getInstance();
        facebook.openSessionWithPermissions(Constants.PERMISSIONS, handleFacebookLogin)
    }

    private function handleFacebookLogin(success:Boolean, userCancelled:Boolean, error:String = null):void {
        if (success) {
            trace("Successfully logged in.");
            this.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE_SCREEN, true, {screen:"facebook_display_profile"}));
        } else {
            var messageString : String = userCancelled ? "Cancelled." : "Error : " + error;
            var message : TextField = new TextField(stage.stageWidth, 20, messageString, "Verdana", 20);
            message.x = 5;
            message.y = stage.stageHeight - 50;
            addChild(message);
            trace("Login failed : " + messageString);
        }
    }


}
}
