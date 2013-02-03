//
//  UIChainTextField.m
//  
//
//  Created by asahi_daiki on 13/02/01.
//  Copyright (c) 2013年 SIROK, Inc. All rights reserved.
//

#import "UIChainTextField.h"

@interface UIChainTextField()

@property (nonatomic, retain) UIChainTextFieldDelegateHandler *delegateHandler;

@end

@implementation UIChainTextField

@synthesize delegateHandler;
@synthesize nextChainResponder;

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self initializeDelegateHandler];
    }
    return self;
}

- (void) dealloc {
    
    self.delegateHandler = nil;
    self.nextChainResponder = nil;
    
    [super dealloc];
    
}

- (void)initializeDelegateHandler {
    delegateHandler = [[UIChainTextFieldDelegateHandler alloc] initWithParentTextField:self];
    self.delegate = delegateHandler;
}

- (void)setDelegate:(id<UITextFieldDelegate>)newDelegate {

    if([newDelegate isKindOfClass:[UIChainTextFieldDelegateHandler class]]) {
        [super setDelegate:newDelegate];
        return;
    }
    delegateHandler.alternativeDelegate = newDelegate;

}

- (BOOL) textFieldShouldReturn {
    [self resignFirstResponder];
    
    if(nextChainResponder) {
        [nextChainResponder becomeFirstResponder];
        return NO;
    }
    return YES;
}

@end
