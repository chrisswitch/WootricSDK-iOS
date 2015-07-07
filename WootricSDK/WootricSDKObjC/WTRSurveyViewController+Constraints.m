//
//  WTRSurveyViewController+ConstraintsViewController.m
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

#import "WTRSurveyViewController+Constraints.h"
#import "WTRSurveyViewController+Utils.h"

@implementation WTRSurveyViewController (Constraints)

- (void)setupConstraints {
  [self setupBackgroundImageViewContraints];
  [self setupScrollViewConstraints];
  [self setupModalConstraint];
  [self setupDismissButtonConstraints];
  [self setupTitleLabelConstraints];
  [self setupSubmitButtonConstraints];
  [self setupSliderConstraints];
  [self setupDragToChangeLabelConstraints];
  [self setupNotLikelyLabelConstraints];
  [self setupExtremelyLikelyLabelConstraints];
  [self setupSliderBackgroundViewConstraints];
  [self setupSliderCheckedBackgroundViewConstraints];
  [self setupScoreLabelConstraints];
  [self setupFeedbackPlaceholderConstraints];
  [self setupCommentTextViewConstraints];
  [self setupSendFeedbackButtonConstraints];
  [self setupButtonIconCheckConstraints];
  [self setupButtonIconSendConstraints];
  [self setupBackButtonConstraints];
  [self setupChosenScoreLabelConstraints];
}

#pragma mark - Buttons

- (void)setupSubmitButtonConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.submitButton
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:12];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.submitButton
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:-65];
  [self.modalView addConstraint:constY];
}

- (void)setupBackButtonConstraints {
  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.backButton
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:2];
  [self.modalView addConstraint:constY];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.backButton
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:2];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.backButton
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:90];
  [self.backButton addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.backButton
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:24];
  [self.backButton addConstraint:constH];
}

- (void)setupSendFeedbackButtonConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.sendFeedbackButton
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:12];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.sendFeedbackButton
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.commentTextView
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:15];
  [self.modalView addConstraint:constY];
}

- (void)setupDismissButtonConstraints {
  NSLayoutConstraint *constXTop = [NSLayoutConstraint constraintWithItem:self.dismissButton
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.modalView
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:268];
  [self.modalView addConstraint:constXTop];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.dismissButton
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:-5];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.dismissButton
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:80];
  [self.dismissButton addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.dismissButton
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:32];
  [self.dismissButton addConstraint:constH];
}

#pragma mark - Labels

- (void)setupTitleLabelConstraints {
  CGFloat topMargin = [self isSmallerScreenDevice] ? 30 : 40;
  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.modalView
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1
                                                               constant:topMargin];
  [self.modalView addConstraint:constTop];

  CGFloat margin = [self isSmallerScreenDevice] ? 20 : 50;
  NSLayoutConstraint *constLeft = [NSLayoutConstraint constraintWithItem:self.titleLabel
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.modalView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1
                                                                constant:margin];
  [self.modalView addConstraint:constLeft];

  NSLayoutConstraint *constRight = [NSLayoutConstraint constraintWithItem:self.modalView
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.titleLabel
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1
                                                                 constant:margin];
  [self.modalView addConstraint:constRight];
}

- (void)setupChosenScoreLabelConstraints {
  self.chosenScoreConstR = [NSLayoutConstraint constraintWithItem:self.chosenScore
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1
                                                      constant:0];

  [self.modalView addConstraint:self.chosenScoreConstR];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.chosenScore
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.titleLabel
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constY];

  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.chosenScore
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:20];
  [self.chosenScore addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.chosenScore
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:20];
  [self.chosenScore addConstraint:constH];
}

- (void)setupScoreLabelConstraints {
  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.titleLabel
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:5];
  [self.modalView addConstraint:constTop];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.titleLabel
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  CGFloat margin = [self isSmallerScreenDevice] ? 10 : 20;
  NSLayoutConstraint *constLeft = [NSLayoutConstraint constraintWithItem:self.scoreLabel
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.modalView
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1
                                                                constant:margin];
  [self.modalView addConstraint:constLeft];

  NSLayoutConstraint *constRight = [NSLayoutConstraint constraintWithItem:self.modalView
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.scoreLabel
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1
                                                                 constant:margin];
  [self.modalView addConstraint:constRight];
}

- (void)setupFeedbackPlaceholderConstraints {
  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.feedbackPlaceholder
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.commentTextView
                                                              attribute:NSLayoutAttributeTop
                                                             multiplier:1
                                                               constant:8];
  [self.modalView addConstraint:constTop];

  NSLayoutConstraint *constL = [NSLayoutConstraint constraintWithItem:self.feedbackPlaceholder
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.commentTextView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:5];
  [self.modalView addConstraint:constL];

  NSLayoutConstraint *constR = [NSLayoutConstraint constraintWithItem:self.commentTextView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.feedbackPlaceholder
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:5];
  [self.modalView addConstraint:constR];
}

- (void)setupExtremelyLikelyLabelConstraints {
  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.extremelyLikelyLabel
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:10];
  [self.modalView addConstraint:constY];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.sliderBackgroundView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.extremelyLikelyLabel
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:25];
  [self.modalView addConstraint:constX];
}

- (void)setupNotLikelyLabelConstraints {
  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.notLikelyLabel
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:10];
  [self.modalView addConstraint:constY];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.notLikelyLabel
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.sliderBackgroundView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:25];
  [self.modalView addConstraint:constX];
}

- (void)setupDragToChangeLabelConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.dragToChangeLabel
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.dragToChangeLabel
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1
                                                             constant:-5];
  [self.modalView addConstraint:constY];
}

#pragma mark - Icons

- (void)setupButtonIconSendConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.buttonIconSend
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.sendFeedbackButton
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:-4];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.buttonIconSend
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.sendFeedbackButton
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constY];
}

- (void)setupButtonIconCheckConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.buttonIconCheck
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.submitButton
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:-4];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.buttonIconCheck
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.submitButton
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constY];
}

#pragma mark - Background Views

- (void)setupBackgroundImageViewContraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constY];

  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.backgroundImageView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constH];
}

- (void)setupSliderCheckedBackgroundViewConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.sliderCheckedBackgroundView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.sliderCheckedBackgroundView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.titleLabel
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:41];
  [self.modalView addConstraint:constTop];

  CGFloat sliderWidth = [self sliderWidthDependingOnDevice];
  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.sliderCheckedBackgroundView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:sliderWidth];
  [self.modalView addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.sliderCheckedBackgroundView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:55];
  [self.modalView addConstraint:constH];
}


- (void)setupSliderBackgroundViewConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.sliderBackgroundView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.sliderBackgroundView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.titleLabel
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:41];
  [self.modalView addConstraint:constTop];

  CGFloat sliderWidth = [self sliderWidthDependingOnDevice];
  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.sliderBackgroundView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:sliderWidth];
  [self.modalView addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.sliderBackgroundView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:55];
  [self.modalView addConstraint:constH];
}

#pragma mark - Misc.

- (void)setupCommentTextViewConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.commentTextView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  CGFloat margin = [self isSmallerScreenDevice] ? 10 : 20;
  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.commentTextView
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scoreLabel
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:margin];
  [self.modalView addConstraint:constY];

  NSLayoutConstraint *constL = [NSLayoutConstraint constraintWithItem:self.commentTextView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:15];
  [self.modalView addConstraint:constL];

  NSLayoutConstraint *constR = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.commentTextView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:15];
  [self.modalView addConstraint:constR];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.commentTextView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:105];
  [self.commentTextView addConstraint:constH];
}

- (void)setupSliderConstraints {
  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.modalView addConstraint:constX];

  NSLayoutConstraint *constTop = [NSLayoutConstraint constraintWithItem:self.scoreSlider
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.titleLabel
                                                              attribute:NSLayoutAttributeBottom
                                                             multiplier:1
                                                               constant:45];
  [self.modalView addConstraint:constTop];

  CGFloat sliderWidth = [self sliderWidthDependingOnDevice] - 12.0;
  self.sliderWidth = [NSLayoutConstraint constraintWithItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:sliderWidth];
  [self.modalView addConstraint:self.sliderWidth];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.scoreSlider
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:45];
  [self.modalView addConstraint:constH];
}

- (void)setupScrollViewConstraints {
  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.scrollView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constW];

  NSLayoutConstraint *constH = [NSLayoutConstraint constraintWithItem:self.scrollView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constH];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.scrollView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constX];

  NSLayoutConstraint *constY = [NSLayoutConstraint constraintWithItem:self.scrollView
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constY];
}

- (void)setupModalConstraint {
  NSLayoutConstraint *constW = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constW];

  self.constModalHeight = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:nil
                                                            attribute:NSLayoutAttributeNotAnAttribute
                                                           multiplier:1
                                                             constant:300];
  [self.modalView addConstraint:self.constModalHeight];

  NSLayoutConstraint *constX = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeCenterX
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.view
                                                            attribute:NSLayoutAttributeCenterX
                                                           multiplier:1
                                                             constant:0];
  [self.view addConstraint:constX];

  NSLayoutConstraint *constB = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scrollView
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1
                                                             constant:0];
  [self.scrollView addConstraint:constB];

  self.constTopToModal = [NSLayoutConstraint constraintWithItem:self.modalView
                                                      attribute:NSLayoutAttributeTop
                                                      relatedBy:NSLayoutRelationEqual
                                                         toItem:self.scrollView
                                                      attribute:NSLayoutAttributeTop
                                                     multiplier:1
                                                       constant:self.view.frame.size.height];

  [self.scrollView addConstraint:self.constTopToModal];

  NSLayoutConstraint *constL = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scrollView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1
                                                             constant:0];
  [self.scrollView addConstraint:constL];

  NSLayoutConstraint *constR = [NSLayoutConstraint constraintWithItem:self.modalView
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.scrollView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1
                                                             constant:0];
  [self.scrollView addConstraint:constR];
}

@end