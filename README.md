#WootricSDK for iOS
##Requirements
- iOS 7.0+

##Demos
- View the iOS demo video with referral prompt [here.](https://cl.ly/dVaI)
- View the iOS demo with App Store rating prompt [here.] (http://cl.ly/2g2W2P1c240U)

##Installation
---
###Using CocoaPods
[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

```bash
$ gem install cocoapods
```
To integrate WootricSDK into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
pod "WootricSDK", "~> 0.5.0"
```
Then, run the following command:

```bash
$ pod install
```

##Usage
---

####Currently available methods for WootricSDK:

```objective-c
+ configureWithClientID:clientSecret:accountToken:
+ showSurveyInViewController:
+ setEndUserEmail:
+ setEndUserCreatedAt:
+ setProductNameForEndUser:
+ setEndUserProperties:
+ setCustomLanguage:
+ setCustomAudience:
+ setCustomProductName:
+ setCustomFinalThankYou:
+ setCustomNPSQuestion:
+ setFirstSurveyAfter:
+ setSurveyedDefault:
+ forceSurvey:
+ surveyImmediately:
+ passScoreAndTextToURL:
+ skipFeedbackScreenForPromoter:
+ setFacebookPage:
+ setTwitterHandler:
+ setThankYouMessage:
+ setDetractorThankYouMessage:
+ setPassiveThankYouMessage:
+ setPromoterThankYouMessage:
+ setThankYouLinkWithText:URL:
+ setDetractorThankYouLinkWithText:URL:
+ setPassiveThankYouLinkWithText:URL:
+ setPromoterThankYouLinkWithText:URL:
+ setCustomFollowupPlaceholderForPromoter:passive:detractor:
+ setCustomFollowupQuestionForPromoter:passive:detractor:
+ setCustomValueForResurveyThrottle:visitorPercentage:registeredPercentage:dailyResponseCap:
+ setSendButtonBackgroundColor:
+ setSliderColor:
+ setThankYouButtonBackgroundColor:
+ setSocialSharingColor:
```

####Required configuration:
---

WootricSDK task is to present a fully functional survey view with just a few lines of code.

First import the SDK's header:
```objective-c
@import WootricSDK;

// or

#import <WootricSDK/WootricSDK.h>
```
Then you need to configure the SDK with your client ID, secret and account token:
```objective-c
[Wootric configureWithClientID:<YOUR_CLIENT_ID> clientSecret:<YOUR_CLIENT_SECRET> accountToken:<YOUR_TOKEN>];
```
And you are good to go! To display the survey (if user is eligible - this check is built in the method) use:
```objective-c
[Wootric showSurveyInViewController:<YOUR_VIEW_CONTROLLER>];
```

####Additional configuration:
---

```objective-c
[Wootric setEndUserEmail:<END_USER_EMAIL>];
```
While end user email is not required it is HIGHLY recommended to set it if possible.

```objective-c
[Wootric forceSurvey:<BOOL>];
```
If forceSurvey is set to YES, the survey is displayed skipping eligibility check AND even if user was already surveyed. This is for test purposes only as it will display the survey every time and for every user.

```objective-c
[Wootric surveyImmediately:<BOOL>];
```
If surveyImmediately is set to YES and user wasn't surveyed yet - eligibility check will return "true" and survey will be displayed. This shouldn't be used on production.

```objective-c
[Wootric setEndUserCreatedAt:<UNIX Timestamp>];
```
When creating a new end user for survey, it will set his/hers external creation date (so for example, date, when end user was created in your iOS application).
This value is also used in eligibility check, to determine if end user should be surveyed.

```objective-c
[Wootric setFirstSurveyAfter:<NUMBER_OF_DAYS>];
```
If not set, defaults to value from admin panel. Used to check if end user was created/last seen earlier than <NUMBER_OF_DAYS> ago and therefore if survey is required.

```objective-c
[Wootric setEndUserProperties:<NSDICTIONARY>];
```
Adds properties object to end user.

```objective-c
[Wootric setProductNameForEndUser:<PRODUCT_NAME>];
```
Directly adds a product name to end user's properties.

```objective-c
[Wootric setSurveyedDefault:<BOOL>];
```
Right after a vote or dismiss we are setting a NSUserDefault that lasts for 90 days and indicates that end user was already surveyed on this device. We are doing this to lower the requests amount to our eligibility server.
If your survey throttle is different than 90 days and/or you don't want to set the surveyed "cookie" you can set this option to ```NO```.

```objective-c
[Wootric passScoreAndTextToURL:<BOOL>];
```
If you enable this setting, score and feedback text will be added as wootric_score and wootric_text params to the "thank you" URL you have provided. (Check "Custom Thank You" section)

```objective-c
[Wootric skipFeedbackScreenForPromoter:<BOOL>];
```
With this option enabled, promoters (score 9-10) will be taken directly to third (social share) screen, skipping the second (feedback) one.

####Per view configuration:

While Wootric is using values you have set in admin panel, it is possible to override these values directly in code.

---

```objective-c
[Wootric setCustomNPSQuestion:<NPS_QUESTION>];
```
Changes NPS Question from admin panel to provided value (English default is "How likely are you to recommend this product or service to a friend or co-worker?").

```objective-c
[Wootric setCustomFinalThankYou:<FINAL_THANK_YOU>];
```

Changes final thank you from admin panel to provided value (English default is "Thank you for your response, and your feedback!).

```objective-c
// You can pass nil value for any of the parameters - it will use defaults for eligibility check if you do so.
[Wootric setCustomValueForResurveyThrottle:<NUMBER_OF_DAYS> visitorPercentage:<0-100> registeredPercentage:<0-100> dailyResponseCap:<0-...>];
```
This method will alter the values of resurvey throttle, tested visitor, registered users percentage and daily response cap used for eligibility check.

```objective-c
[Wootric setCustomFollowupQuestionForPromoter:<CUSTOM_QUESTION> passive:<CUSTOM_QUESTION> detractor:<CUSTOM_QUESTION>];
```
This method allows you to set custom question for each type of end user (detractor, passive or promoter). Passing ```nil``` for any of the parameters will result in using defaults set in Wootric's admin panel for that type of end user.

```objective-c
[Wootric setCustomFollowupPlaceholderForPromoter:<CUSTOM_PLACEHOLDER> passive:<CUSTOM_PLACEHOLDER> detractor:<CUSTOM_PLACEHOLDER>];
```
Same as with custom question, it allows you to set custom placeholder text in feedback text view for each type of end user. Be advised that this setting takes precedence over values set in Wootric's from admin panel.

####Custom language, audience text and product name configuration:
---
```objective-c
[Wootric setCustomLanguage:<LANGUAGE_CODE>];
[Wootric setCustomAudience:<CUSTOM_AUDIENCE>];
[Wootric setCustomProductName:<CUSTOM_PRODUCT_NAME>];
```
Please refer to our [docs](http://docs.wootric.com/install/#custom-language-setting) for available languages.

Custom audience and/or product name modifies the default NPS question e.g. default question in English looks like this:
"How likely are you to recommend this product or service to a friend or co-worker?"
if custom product name is set it will substitute "this product or service" text, while custom audience will substitute "friend or co-worker". It also takes precedence over values set in admin panel.

####Custom Thank You
---

```objective-c
// Social share setup
[Wootric setFacebookPage:<FACEBOOK_PAGE_URL>];
[Wootric setTwitterHandler:<TWITTER_HANDLER>];

// Custom thank you messages setup
[Wootric setThankYouMessage:<THANK_YOU_MESSAGE>];
[Wootric setDetractorThankYouMessage:<THANK_YOU_MESSAGE>];
[Wootric setPassiveThankYouMessage:<THANK_YOU_MESSAGE>];
[Wootric setPromoterThankYouMessage:<THANK_YOU_MESSAGE>];

// Custom thank you button setup
[Wootric setThankYouLinkWithText:<THANK_YOU_TEXT> URL:<THANK_YOU_URL>];
[Wootric setDetractorThankYouLinkWithText:<THANK_YOU_TEXT> URL:<THANK_YOU_URL>];
[Wootric setPassiveThankYouLinkWithText:<THANK_YOU_TEXT> URL:<THANK_YOU_URL>];
[Wootric setPromoterThankYouLinkWithText:<THANK_YOU_TEXT> URL:<THANK_YOU_URL>];

```

If configured, social share will display third screen for promoters (score 9-10, also twitter displays only if there is a feedback text provided), while custom thank you message and/or button will display for each type of end user that is configured (where ```setThankYouMessage:``` and ```setThankYouLinkWithText:URL:``` being default for any score).

For detailed information please refer to [js docs](http://docs.wootric.com/install/#social-media-share-settings).
####Color Customization (iPhone only)
---

```objective-c
// Change slider color
[Wootric setSliderColor:<UI_COLOR>];
```
Changes the color of the Survey Score Graphics and the Edit Score button on the feedback view.
```objective-c
// Change Send button color
[Wootric setSendButtonBackgroundColor:<UI_COLOR>];
```
Changes the color of the Send button and the No thanks button on the sharing view.
```objective-c
// Change Thank You button color
[Wootric setThankYouButtonBackgroundColor:<UI_COLOR>;
```
Changes the color of the Thank You button on the sharing view.
```objective-c
// Change Social buttons color
[Wootric setSocialSharingColor:<UI_COLOR>];
```
Changes the color of Facebook, Twitter and Thumbs up button on the sharing view.

####Additional information:
---
#####First survey after & end user created at setting:
While it is not required, setting ```setEndUserCreatedAt``` is highly recommended for proper checking if end user needs survey and skipping uneccessary eligibility checks.
