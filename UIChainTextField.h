//
//  UIChainTextField.h
//  
//
//  Created by asahi_daiki on 13/02/01.
//  Copyright (c) 2013年 SIROK, Inc. All rights reserved.
//

#import "UIChainTextFieldDelegateHandler.h"

@interface UIChainTextField : UITextField {

    /** UITextFieldのデリゲートを管理するオブジェクト */
    UIChainTextFieldDelegateHandler *delegateHandler;
    
    /** 次に処理すべきUIResponderのサブクラス */
    IBOutlet UIResponder *nextChainResponder;

}

@property (nonatomic, assign) IBOutlet UIResponder *nextChainResponder;

- (BOOL) textFieldShouldReturn;

@end
