//
//  ViewController.m
//  StepperWithDelegates&Protocols
//
//  Created by Matt Milner on 6/23/16.
//  Copyright © 2016 Matt Milner. All rights reserved.
//

#import "ViewController.h"
#import "StepperView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // screen height and width
    NSInteger screenHeight = self.view.frame.size.height;
    NSInteger screenWidth = self.view.frame.size.width;
    
    
    
    
    StepperView *stepperView = [[StepperView alloc] initWithFrame:CGRectMake((screenWidth)/2 - 125, (screenHeight)/2  - 125, 250, 65)];
    stepperView.delegate = self;
    [self.view addSubview:stepperView];
    
    
    
    
}

-(void) stepperValueChanged:(NSString *)changed count:(long)count{
    NSLog(@"Button Pressed: %@ New Stepper Value: %ld",changed,count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
