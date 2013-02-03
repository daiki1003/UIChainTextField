//
//  UIChainTextFieldDelegateHandler.h
//  
//
//  Created by asahi_daiki on 13/02/01.
//  Copyright (c) 2013年 SIROK, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIChainTextField;

@interface UIChainTextFieldDelegateHandler : NSObject <UITextFieldDelegate> {
    
    /** このハンドラを所持しているTextField */
    UIChainTextField *parentTextField;
    
    /** UITextFieldDelegateの代替役 */
    id <UITextFieldDelegate> alternativeDelegate;
    
}

@property (nonatomic, assign) id <UITextFieldDelegate> alternativeDelegate;

- (id) initWithParentTextField:(UIChainTextField *)initParentTextField;

@end
