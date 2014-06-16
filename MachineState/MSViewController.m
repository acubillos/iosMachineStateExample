//
//  MSViewController.m
//  MachineState
//
//  Created by acubillos on 6/16/14.
//  Copyright (c) 2014 rentpath. All rights reserved.
//

#import "MSViewController.h"

@interface MSViewController ()

@end

@implementation MSViewController

typedef NS_ENUM(NSInteger, InputState) {
    StartingState,
    WState,
    XState,
    YState,
    ZState
};

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionScan:(id)sender {
    NSString *inputText = self.inputTextView.text;
//    NSString *regex = self.regexTextView.text;
    NSMutableString *returnString = [[NSMutableString alloc] init];
    NSMutableString *currentMatch = [[NSMutableString alloc] init];
    InputState currentState = StartingState;
    
    int i=0;
    while (i<inputText.length) {
        switch ([inputText characterAtIndex:i]) {
            case 'w':
                if (currentState == StartingState) {
                    currentMatch = [[NSMutableString alloc] init];
                    [currentMatch appendString:@"w"];
                    currentState = WState;
                }
                
                break;
            case 'x':
                if (currentState == WState || currentState == XState) {
                    [currentMatch appendString:@"x"];
                    currentState = XState;
                } else {
                    currentState = StartingState;
                    currentMatch = nil;
                }
                
                break;
                
            case 'y':
                if (currentState == WState || currentState == YState) {
                    [currentMatch appendString:@"y"];
                    currentState = YState;
                } else {
                    currentState = StartingState;
                    currentMatch = nil;
                }
                break;
                
            case 'z':
                if (currentState == XState || currentState == YState) {
                    currentState = ZState;
                    [currentMatch appendString:@"z"];
                    if (returnString.length > 0) {
                        [returnString appendString:@"-"];
                    }
                    [returnString appendString:currentMatch];
                }
                currentMatch = nil;
                currentState = StartingState;
                
                break;
                
            default:
                currentMatch = nil;
                currentState = StartingState;
                break;
        }
        i++;
    }
    
    self.resultsTextView.text = returnString;
}



@end
