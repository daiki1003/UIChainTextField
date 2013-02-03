//
//  UIChainTextFieldDelegateHandler.m
//  
//
//  Created by asahi_daiki on 13/02/01.
//  Copyright (c) 2013年 SIROK, Inc. All rights reserved.
//

#import "UIChainTextFieldDelegateHandler.h"
#import "UIChainTextField.h"

@interface UIChainTextFieldDelegateHandler ()

@property (nonatomic, assign) UIChainTextField *parentTextField;

@end

@implementation UIChainTextFieldDelegateHandler

@synthesize parentTextField;
@synthesize alternativeDelegate;

- (id) initWithParentTextField:(UIChainTextField *)initParentTextField {
    self = [super init];
    if(self) {
        self.parentTextField = initParentTextField;
    }
    return self;
}

- (void) dealloc {
    
    self.parentTextField = nil;
    self.alternativeDelegate = nil;
    
    [super dealloc];

}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [alternativeDelegate textFieldShouldBeginEditing:textField];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return;
    }
    [alternativeDelegate textFieldDidBeginEditing:textField];
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [alternativeDelegate textFieldShouldEndEditing:textField];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return;
    }
    [alternativeDelegate textFieldDidEndEditing:textField];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [alternativeDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {

    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return YES;
    }
    return [alternativeDelegate textFieldShouldClear:textField];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    BOOL shouldReturn = YES;

    shouldReturn &= [parentTextField textFieldShouldReturn];
    if(![alternativeDelegate respondsToSelector:_cmd]) {
        return shouldReturn;
    }

    shouldReturn &= [alternativeDelegate textFieldShouldReturn:textField];
    return shouldReturn;

}

@end
