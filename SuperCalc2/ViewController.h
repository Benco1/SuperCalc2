//
//  ViewController.h
//  SuperCalc2
//
//  Created by BC on 12/15/14.
//  Copyright (c) 2014 BenCodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
    int operator;           // Variables
    NSString *previous;
    NSString *current;
}

- (void) doEquals;

@property (weak, nonatomic) IBOutlet UILabel *theTotal;

- (IBAction)numButtons:(UIButton *)sender;

- (IBAction)opButtons:(UIButton *)sender;

- (IBAction)eqButton:(UIButton *)sender;

- (IBAction)clearButton:(UIButton *)sender;

- (IBAction)decimalButton:(UIButton *)sender;

@end

