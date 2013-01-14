package {

import com.freshplanet.nativeExtensions.InAppPurchase;
import com.freshplanet.nativeExtensions.InAppPurchaseEvent;

import flash.display.Sprite;
import flash.text.TextField;

public class ANEInAppPurchaseSample extends Sprite {
    public function ANEInAppPurchaseSample() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);

        var inAppPurchase : InAppPurchase  = InAppPurchase.getInstance();
        inAppPurchase.makePurchase("benjamin_100_coins");

        inAppPurchase.addEventListener(InAppPurchaseEvent.PURCHASE_ERROR, handlePurchaseError);
        inAppPurchase.addEventListener(InAppPurchaseEvent.PURCHASE_SUCCESSFULL, handlePurchaseSuccess);
    }

    private function handlePurchaseSuccess(event:InAppPurchaseEvent):void {
        trace("Purchase successful");
    }

    private function handlePurchaseError(event:InAppPurchaseEvent):void {
        trace("Purchase failed.");
    }
}
}
