//
//  WTRSettings.m
//  WootricSDK
//
// Copyright (c) 2015 Wootric (https://wootric.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "WTRSettings.h"
#import "WTRLocalizedTexts.h"
#import "WTRCustomMessages.h"
#import "WTRCustomThankYou.h"
#import "WTRUserCustomMessages.h"
#import "WTRColor.h"

@interface WTRSettings ()

@property (nonatomic, strong) WTRLocalizedTexts *localizedTexts;
@property (nonatomic, strong) WTRCustomMessages *customMessages;
@property (nonatomic, strong) WTRCustomThankYou *customThankYou;
@property (nonatomic, strong) WTRUserCustomMessages *userCustomMessages;

@end

@implementation WTRSettings

- (instancetype)init {
    
  if (self = [super init]) {
    _setDefaultAfterSurvey = YES;
    _surveyedDefaultDuration = 90;
    _surveyedDefaultDurationDecline = 30;
    _firstSurveyAfter = @0;
    _originURL = [[NSBundle mainBundle] bundleIdentifier];
    _customThankYou = [[WTRCustomThankYou alloc] init];
    _userCustomMessages = [[WTRUserCustomMessages alloc] init];
    _timeDelay = 0;
  }
    
  return self;
}

- (void)parseDataFromSurveyServer:(NSDictionary *)surveyServerSettings {
  NSDictionary *localizedTextsFromSurvey;
  NSDictionary *customMessagesFromSurvey;
    
  if (surveyServerSettings[@"settings"]) {
    localizedTextsFromSurvey = surveyServerSettings[@"settings"][@"localized_texts"];
    customMessagesFromSurvey = surveyServerSettings[@"settings"][@"messages"];
    NSNumber *firstSurvey = surveyServerSettings[@"settings"][@"first_survey"];
    NSNumber *resurveyThrottleFromServer = surveyServerSettings[@"settings"][@"resurvey_throttle"];
    NSNumber *declineResurveyThrottleFromServer = surveyServerSettings[@"settings"][@"decline_resurvey_throttle"];
    NSInteger delay = [surveyServerSettings[@"settings"][@"time_delay"] integerValue];
        
    if (localizedTextsFromSurvey) {
      _localizedTexts = [[WTRLocalizedTexts alloc] initWithLocalizedTexts:localizedTextsFromSurvey];
    }
        
    if (customMessagesFromSurvey) {
      _customMessages = [[WTRCustomMessages alloc] initWithCustomMessages:customMessagesFromSurvey];
    }
        
    if (firstSurvey) {
      _firstSurveyAfter = firstSurvey;
    }
        
    if (delay > 0) {
      _timeDelay = delay;
    }
    
    if (resurveyThrottleFromServer) {
      _surveyedDefaultDuration = [resurveyThrottleFromServer intValue];
    }
    
    if (declineResurveyThrottleFromServer) {
      _surveyedDefaultDurationDecline = [declineResurveyThrottleFromServer intValue];
    }
  }
}

- (NSString *)getEndUserEmailOrUnknown {
  if (!_endUserEmail || ![self validEmailString]) {
    return @"Unknown";
  }
  return _endUserEmail;
}

- (NSString *)followupQuestionTextForScore:(int)score {
  if (!_customMessages && ![_userCustomMessages userCustomQuestionPresent]) {
    return _localizedTexts.followupQuestion;
  }
    
  if (score <= 6 && (_customMessages.detractorQuestion || _userCustomMessages.detractorQuestion)) {
    return [self detractorFollowupQuestion];
  } else if (score > 6 && score <= 8 && (_customMessages.passiveQuestion || _userCustomMessages.passiveQuestion)) {
    return [self passiveFollowupQuestion];
  } else if (score > 8 && score <= 10 && (_customMessages.promoterQuestion || _userCustomMessages.promoterQuestion)) {
    return [self promoterFollowupQuestion];
  }
    
  return _localizedTexts.followupQuestion;
}

- (NSString *)followupPlaceholderTextForScore:(int)score {
  if (!_customMessages && ![_userCustomMessages userCustomPlaceholderPresent]) {
    return _localizedTexts.followupPlaceholder;
  }
    
  if (score <= 6 && (_customMessages.detractorText || _userCustomMessages.detractorPlaceholderText)) {
    return [self detractorFollowupPlaceholder];
  } else if (score > 6 && score <= 8 && (_customMessages.passiveText || _userCustomMessages.passivePlaceholderText)) {
    return [self passiveFollowupPlaceholder];
  } else if (score > 8 && score <= 10 && (_customMessages.promoterText || _userCustomMessages.promoterPlaceholderText)) {
    return [self promoterFollowupPlaceholder];
  }
    
  return _localizedTexts.followupPlaceholder;
}

- (NSString *)detractorFollowupQuestion {
  if (_userCustomMessages.detractorQuestion) {
    return _userCustomMessages.detractorQuestion;
  }
    
  return _customMessages.detractorQuestion;
}

- (NSString *)passiveFollowupQuestion {
  if (_userCustomMessages.passiveQuestion) {
    return _userCustomMessages.passiveQuestion;
  }
    
  return _customMessages.passiveQuestion;
}

- (NSString *)promoterFollowupQuestion {
  if (_userCustomMessages.promoterQuestion) {
    return _userCustomMessages.promoterQuestion;
  }
    
  return _customMessages.promoterQuestion;
}

- (NSString *)detractorFollowupPlaceholder {
  if (_userCustomMessages.detractorPlaceholderText) {
    return _userCustomMessages.detractorPlaceholderText;
  }
    
  return _customMessages.detractorText;
}

- (NSString *)passiveFollowupPlaceholder {
  if (_userCustomMessages.passivePlaceholderText) {
    return _userCustomMessages.passivePlaceholderText;
  }
    
  return _customMessages.passiveText;
}

- (NSString *)promoterFollowupPlaceholder {
  if (_userCustomMessages.promoterPlaceholderText) {
    return _userCustomMessages.promoterPlaceholderText;
  }
    
  return _customMessages.promoterText;
}

- (NSString *)npsQuestionText {
  if (_customNPSQuestion) {
    return _customNPSQuestion;
  }
  return _localizedTexts.npsQuestion;
}

- (NSString *)likelyAnchorText {
  return _localizedTexts.likelyAnchor;
}

- (NSString *)notLikelyAnchorText {
  return _localizedTexts.notLikelyAnchor;
}

- (NSString *)finalThankYouText {
  if (_customFinalThankYou) {
    return _customFinalThankYou;
  }
  return _localizedTexts.finalThankYou;
}

- (NSString *)sendButtonText {
  return _localizedTexts.send;
}

- (UIColor *)sendButtonBackgroundColor {
  if (_sendButtonBackgroundColor) {
    return _sendButtonBackgroundColor;
  }
  return [WTRColor sendButtonBackgroundColor];
}

- (UIColor *)sliderColor {
  if (_sliderColor) {
    return _sliderColor;
  }
  return [WTRColor sliderValueColor];
}

- (UIColor *)thankYouButtonBackgroundColor {
  if (_customThankYou.backgroundColor) {
    return _customThankYou.backgroundColor;
  }
  return [WTRColor callToActionButtonBackgroundColor];
}

- (UIColor *)socialSharingColor {
  if (_socialSharingColor) {
    return _socialSharingColor;
  }
  return [WTRColor socialShareQuestionTextColor];
}

- (NSString *)dismissButtonText {
  return _localizedTexts.dismiss;
}

- (NSString *)editScoreButtonText {
  return _localizedTexts.editScore;
}

- (NSString *)socialShareQuestionText {
  return _localizedTexts.socialShareQuestion;
}

- (NSString *)socialShareDeclineText {
  return _localizedTexts.socialShareDecline;
}

- (void)setThankYouButtonBackgroundColor:(UIColor *)thankYouButtonBackgroundColor {
  _customThankYou.backgroundColor = thankYouButtonBackgroundColor;
}

- (void)setThankYouMessage:(NSString *)thankYouMessage {
  _customThankYou.thankYouMessage = thankYouMessage;
}

- (void)setDetractorThankYouMessage:(NSString *)detractorThankYouMessage {
  _customThankYou.detractorThankYouMessage = detractorThankYouMessage;
}

- (void)setPassiveThankYouMessage:(NSString *)passiveThankYouMessage {
  _customThankYou.passiveThankYouMessage = passiveThankYouMessage;
}

- (void)setPromoterThankYouMessage:(NSString *)promoterThankYouMessage {
  _customThankYou.promoterThankYouMessage = promoterThankYouMessage;
}

- (void)setThankYouLinkWithText:(NSString *)thankYouLinkText URL:(NSURL *)thankYouLinkURL {
  _customThankYou.thankYouLinkText = thankYouLinkText;
  _customThankYou.thankYouLinkURL = thankYouLinkURL;
}

- (void)setDetractorThankYouLinkWithText:(NSString *)detractorThankYouLinkText URL:(NSURL *)detractorThankYouLinkURL {
  _customThankYou.detractorThankYouLinkText = detractorThankYouLinkText;
  _customThankYou.detractorThankYouLinkURL = detractorThankYouLinkURL;
}

- (void)setPassiveThankYouLinkWithText:(NSString *)passiveThankYouLinkText URL:(NSURL *)passiveThankYouLinkURL {
  _customThankYou.passiveThankYouLinkText = passiveThankYouLinkText;
  _customThankYou.passiveThankYouLinkURL = passiveThankYouLinkURL;
}

- (void)setPromoterThankYouLinkWithText:(NSString *)promoterThankYouLinkText URL:(NSURL *)promoterThankYouLinkURL {
  _customThankYou.promoterThankYouLinkText = promoterThankYouLinkText;
  _customThankYou.promoterThankYouLinkURL = promoterThankYouLinkURL;
}

- (void)setCustomFollowupQuestionForPromoter:(NSString *)promoterQuestion passive:(NSString *)passiveQuestion detractor:(NSString *)detractorQuestion {
  _userCustomMessages.promoterQuestion = promoterQuestion;
  _userCustomMessages.passiveQuestion = passiveQuestion;
  _userCustomMessages.detractorQuestion = detractorQuestion;
}

- (void)setCustomFollowupPlaceholderForPromoter:(NSString *)promoterPlaceholder passive:(NSString *)passivePlaceholder detractor:(NSString *)detractorPlaceholder {
  _userCustomMessages.promoterPlaceholderText = promoterPlaceholder;
  _userCustomMessages.passivePlaceholderText = passivePlaceholder;
  _userCustomMessages.detractorPlaceholderText = detractorPlaceholder;
}

- (NSString *)thankYouMessageDependingOnScore:(int)score {
    
  if (score <= 6 && _customThankYou.detractorThankYouMessage) {
    return _customThankYou.detractorThankYouMessage;
  } else if (score > 6 && score <= 8 && _customThankYou.passiveThankYouMessage) {
    return _customThankYou.passiveThankYouMessage;
  } else if (score > 8 && score <= 10 && _customThankYou.promoterThankYouMessage) {
    return _customThankYou.promoterThankYouMessage;
  } else if (_customThankYou.thankYouMessage) {
    return _customThankYou.thankYouMessage;
  }
    
  return nil;
}

- (NSString *)thankYouLinkTextDependingOnScore:(int)score {
    
  if (score <= 6 && _customThankYou.detractorThankYouLinkText) {
    return _customThankYou.detractorThankYouLinkText;
  } else if (score > 6 && score <= 8 && _customThankYou.passiveThankYouLinkText) {
    return _customThankYou.passiveThankYouLinkText;
  } else if (score > 8 && score <= 10 && _customThankYou.promoterThankYouLinkText) {
    return _customThankYou.promoterThankYouLinkText;
  } else if (_customThankYou.thankYouLinkText) {
    return _customThankYou.thankYouLinkText;
  }
    
  return nil;
}

- (NSURL *)thankYouLinkURLDependingOnScore:(int)score andText:(NSString *)text {
    
  if (score <= 6 && _customThankYou.detractorThankYouLinkURL) {
    if (_passScoreAndTextToURL) {
      return [self url:_customThankYou.detractorThankYouLinkURL withScore:score andText:text];
    }
    return _customThankYou.detractorThankYouLinkURL;
  } else if (score > 6 && score <= 8 && _customThankYou.passiveThankYouLinkURL) {
    if (_passScoreAndTextToURL) {
      return [self url:_customThankYou.passiveThankYouLinkURL withScore:score andText:text];
    }
    return _customThankYou.passiveThankYouLinkURL;
  } else if (score > 8 && score <= 10 && _customThankYou.promoterThankYouLinkURL) {
    if (_passScoreAndTextToURL) {
      return [self url:_customThankYou.promoterThankYouLinkURL withScore:score andText:text];
    }
    return _customThankYou.promoterThankYouLinkURL;
  } else if (_customThankYou.thankYouLinkURL) {
    if (_passScoreAndTextToURL) {
      return [self url:_customThankYou.thankYouLinkURL withScore:score andText:text];
    }
    return _customThankYou.thankYouLinkURL;
  }
  
  return nil;
}

- (BOOL)thankYouLinkConfiguredForScore:(int)score {
    
  if (score <= 6 && [self detractorOrDefaultURL] && [self detractorOrDefaultText]) {
    return YES;
  }
  else if (score > 6 && score <= 8 && [self passiveOrDefaultURL] && [self passiveOrDefaultText]) {
    return YES;
  }
  else if (score > 8 && score <= 10 && [self promoterOrDefaultURL] && [self promoterOrDefaultText]) {
    return YES;
  }
  else if (_customThankYou.thankYouLinkURL && _customThankYou.thankYouLinkText) {
    return YES;
  }
  
  return NO;
}

- (BOOL)detractorOrDefaultURL {
  return (_customThankYou.detractorThankYouLinkURL || _customThankYou.thankYouLinkURL);
}

- (BOOL)detractorOrDefaultText {
  return (_customThankYou.detractorThankYouLinkText || _customThankYou.thankYouLinkText);
}

- (BOOL)passiveOrDefaultURL {
  return (_customThankYou.passiveThankYouLinkURL || _customThankYou.thankYouLinkURL);
}

- (BOOL)passiveOrDefaultText {
  return (_customThankYou.passiveThankYouLinkText || _customThankYou.thankYouLinkText);
}

- (BOOL)promoterOrDefaultURL {
  return (_customThankYou.promoterThankYouLinkURL || _customThankYou.thankYouLinkURL);
}

- (BOOL)promoterOrDefaultText {
  return (_customThankYou.promoterThankYouLinkText || _customThankYou.thankYouLinkText);
}

- (BOOL)twitterHandlerSet {
  return !!_twitterHandler;
}

- (BOOL)facebookPageSet {
  return !!_facebookPage;
}

- (void)setCustomResurveyThrottle:(NSNumber *)customResurveyThrottle {
  if ([customResurveyThrottle intValue] < 0) {
    customResurveyThrottle = @0;
  }
  _resurveyThrottle = customResurveyThrottle;
}

- (void)setCustomVisitorPercentage:(NSNumber *)customVisitorPercentage {
  if ([customVisitorPercentage intValue] < 0) {
    customVisitorPercentage = @0;
  } else if ([customVisitorPercentage intValue] > 100) {
    customVisitorPercentage = @100;
  }
  _visitorPercentage = customVisitorPercentage;
}

- (void)setCustomRegisteredPercentage:(NSNumber *)customRegisteredPercentage {
  if ([customRegisteredPercentage intValue] < 0) {
    customRegisteredPercentage = @0;
  } else if ([customRegisteredPercentage intValue] > 100) {
    customRegisteredPercentage = @100;
  }
  _registeredPercentage = customRegisteredPercentage;
}

- (void)setCustomDailyResponseCap:(NSNumber *)customDailyResponseCap {
  if ([customDailyResponseCap intValue] < 0) {
    customDailyResponseCap = @0;
  }
  _dailyResponseCap = customDailyResponseCap;
}

- (BOOL)validEmailString {
  NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return !([[_endUserEmail stringByTrimmingCharactersInSet:set] length] == 0);
}

- (NSURL *)url:(NSURL *)baseUrl withScore:(int)score andText:(NSString *)text {
  NSString *paramsString;
  NSString *escapedText = [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  
  if (!escapedText) {
    escapedText = @"";
  }
  
  if ([[baseUrl absoluteString] rangeOfString:@"?"].location == NSNotFound) {
    paramsString = [NSString stringWithFormat:@"?wootric_score=%d&wootric_text=%@", score, escapedText];
    return [NSURL URLWithString:paramsString relativeToURL:baseUrl];
  } else {
    paramsString = [NSString stringWithFormat:@"&wootric_score=%d&wootric_text=%@", score, escapedText];
    return [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", baseUrl, paramsString]];
  }
}

@end
