//
//  OWLPaddingTextField.m
//  hiboux
//
//  Created by Jonas Oesch on 17.01.14.
//  Copyright (c) 2014 Jonas Oesch. All rights reserved.
//

#import "OWLPaddingTextField.h"

@implementation OWLPaddingTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (CGRect)textRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    return [self rectForBounds:bounds];
}

//here 40 - is your x offset
- (CGRect)rectForBounds:(CGRect)bounds {
    return CGRectInset(bounds, 10, 3);
}

@end
