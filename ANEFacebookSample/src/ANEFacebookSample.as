package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.Rectangle;

import net.peakgames.mobile.air.anefacebook.sample.FacebookApp;

import net.peakgames.mobile.air.anefacebook.sample.FacebookLoginScreen;

import starling.core.Starling;

public class ANEFacebookSample extends Sprite {

    private var starling : Starling;

    public function ANEFacebookSample() {
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;

        var screenSize : Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);

        starling =  new Starling(FacebookApp, stage, screenSize);
        starling.start();
    }
}
}
