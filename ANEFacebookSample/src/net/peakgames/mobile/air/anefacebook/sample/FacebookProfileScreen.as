/**
 * Date: 1/13/13
 * Time: 10:13 PM
 */
package net.peakgames.mobile.air.anefacebook.sample {
import com.freshplanet.ane.AirFacebook.Facebook;

import flash.display.Bitmap;

import flash.display.Loader;
import flash.net.URLRequest;

import starling.display.Button;

import starling.display.DisplayObject;

import starling.display.Image;

import starling.display.Sprite;
import starling.events.Event;
import starling.text.TextField;
import starling.textures.Texture;

public class FacebookProfileScreen extends Sprite {

    private var profilePictureLoader : Loader;
    private var loadingImage : Image;
    private var nameTf : TextField;
    private var surnameTf : TextField;
    private var logoutButton : Button;

    [Embed(source="../../../../../../../media/loading-icon.gif")]
    private var LoadingIconAsset:Class;

    [Embed(source="../../../../../../../media/logout.png")]
    private var LogoutIconAsset:Class;

    public function FacebookProfileScreen() {
        addEventListener(Event.ADDED_TO_STAGE, initialize);
    }

    private function initialize(event:Event):void {
        var screenWidth : Number  = stage.stageWidth;
        var screenHeight : Number = stage.stageHeight;
        nameTf = new TextField(screenWidth, screenHeight/8, "Name", "Verdana", screenHeight/10);
        surnameTf = new TextField(screenWidth, screenHeight/8, "Surname", "Verdana", screenHeight/10);

        nameTf.x = 20;
        nameTf.y = screenHeight/3 + screenHeight/8;

        surnameTf.x = nameTf.x;
        surnameTf.y = nameTf.y + screenHeight/8;


        loadingImage = new Image(Texture.fromBitmap(new LoadingIconAsset()));
        addImage(loadingImage);

        addChild(nameTf);
        addChild(surnameTf);
    }

    public function fetchData() : void {
        var facebook : Facebook = Facebook.getInstance();
        facebook.extendAccessTokenIfNeeded();
        facebook.requestWithGraphPath("me", {}, "GET", handleResponse);
        trace("Request /me sent. Waiting response...");
    }

    private function handleResponse(data : Object) : void {
        trace("Response received. data = " + data);
        nameTf.text = data.first_name;
        surnameTf.text = data.last_name;
        var profilePictureURL : String = "http://graph.facebook.com/" + data.id + "/picture";

        profilePictureLoader = new Loader();
        profilePictureLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);

        var urlRequest:URLRequest = new URLRequest(profilePictureURL);
        profilePictureLoader.load(urlRequest);
    }

    public function onLoaderComplete(e : Object) : void {
        /*
        Loader dispatches flash events. (Loader class is not part of Starling framework)
        In order to catch Loader events event parameter is declared as Object.
         */

        removeChild(loadingImage);

        var texture : Texture = Texture.fromBitmap(profilePictureLoader.content as Bitmap);
        var profileImage : Image = new Image(texture);
        addImage(profileImage);
        addLogoutButton();
    }

    private function addLogoutButton():void {
        logoutButton = new Button(Texture.fromBitmap(new LogoutIconAsset()), "Logout");
        logoutButton.x = 0;
        logoutButton.y = stage.stageHeight - logoutButton.height;
        logoutButton.addEventListener(Event.TRIGGERED, handleLogout);
        addChild(logoutButton);
    }

    private function handleLogout(event:Event):void {
        var facebook : Facebook = Facebook.getInstance();
        facebook.closeSessionAndClearTokenInformation();
        this.dispatchEvent(new ChangeScreenEvent(ChangeScreenEvent.CHANGE_SCREEN, true, {screen:"facebook_login"}));
    }

    private function addImage(image : DisplayObject) : void {
        var screenWidth : Number  = stage.stageWidth;
        var screenHeight : Number = stage.stageHeight;
        image.x = screenWidth/3;
        image.y = 50;
        image.width = screenWidth/3;
        image.height = image.width;
        addChild(image);
    }
}
}
