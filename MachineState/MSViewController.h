//
//  MSViewController.h
//  MachineState
//
//  Created by acubillos on 6/16/14.
//  Copyright (c) 2014 rentpath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *regexTextView;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;

- (IBAction)actionScan:(id)sender;
@end
