//
//  StepperView.h
//  StepperWithDelegates&Protocols
//
//  Created by Matt Milner on 6/23/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StepperViewDelegate

-(void) stepperValueChanged: (NSString *) changed count: (long) count;

@end


@interface StepperView : UIView
{
    UILabel *count;
}


@property (nonatomic,weak) id <StepperViewDelegate> delegate;





@end
