//
//  StepperView.m
//  StepperWithDelegates&Protocols
//
//  Created by Matt Milner on 6/23/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "StepperView.h"

@implementation StepperView
{
    
}


// Create stepperView object to be a subview of the root

-(instancetype) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

-(void) setup{
    
    // 250 x 65 pixels to work with
    // Create border (using another view) with buttons and label
    
    UIView *borderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 65)]; // Shadow effect by making it only 4 pixels, cover the rest
    borderView.backgroundColor = [UIColor blackColor];
    
    [self addSubview:borderView];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(2, 2, 246, 61)];
    contentView.backgroundColor = [UIColor blueColor];
    
    [borderView addSubview: contentView];
    
    UIButton *minusButton = [[UIButton alloc] initWithFrame:CGRectMake(2, 2, 37, 61)];
    minusButton.backgroundColor = [UIColor blueColor];
    [minusButton setTitle:@"-" forState:UIControlStateNormal];
    minusButton.titleLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:20.0];
    minusButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [minusButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *plusButton = [[UIButton alloc] initWithFrame:CGRectMake(209, 2, 37, 61)];
    plusButton.backgroundColor = [UIColor blueColor];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    plusButton.titleLabel.font = [UIFont fontWithName:@"Georgia-Bold" size:20.0];
    plusButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [plusButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    count = [[UILabel alloc] initWithFrame:CGRectMake(41, 2, 164, 61)];
    count.backgroundColor = [UIColor whiteColor];
    count.textColor = [UIColor blueColor];
    count.textAlignment = NSTextAlignmentCenter;
    count.text = @"0";
    
    [borderView addSubview:minusButton];
    [borderView addSubview:plusButton];
    [borderView addSubview:count];
    
    
}

-(void) buttonPressed:(id) sender{
    
    UIButton *button = (UIButton *) sender;
    NSString *buttonValue = button.titleLabel.text;
    NSInteger currentCount = count.text.integerValue;

    
    if ([buttonValue isEqualToString:@"+"]){
        count.text = [NSString stringWithFormat:@"%ld",(currentCount+1)];
        //notify delegate of change type and feed it the current value
        [self.delegate stepperValueChanged:@"+" count:(long)currentCount+1];
    }
    else if ([buttonValue isEqualToString:@"-"]){
        count.text = [NSString stringWithFormat:@"%ld",(currentCount-1)];
        // notify delegate of change type and feed it the current value
        [self.delegate stepperValueChanged:@"-" count:(long)currentCount-1];
    }
    
    
    
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
