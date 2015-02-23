//
//  ViewController.m
//  SuperCalc2
//
//  Created by BC on 12/15/14.
//  Copyright (c) 2014 BenCodes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theTotal;

- (void)viewDidLoad {
    
    operator=0;
    current=@"0";
    previous=@"0";
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)numButtons:(UIButton *)sender {
    
    NSString *str= (NSString *)[sender currentTitle];
    if ([current isEqualToString:@"0"]) {
        current = str;
    } else {
        current = [current stringByAppendingString:str];
    }
    [theTotal setText:current];
}

- (IBAction)opButtons:(UIButton *)sender {
    
    NSString *tmpStr = [current substringFromIndex:(current.length - 1)];
    if ([tmpStr isEqualToString:@"."]) {
        current = (NSString *)[current substringToIndex:(current.length - 1)];
        
        [theTotal setText:current];
    }
    
    NSString *str=(NSString *)[sender currentTitle];
    if (operator >= 1 && operator <= 4) {
        [self doEquals];
    }
    if (operator!=5) {
        previous = [current copy];
        current = @"0";
    }
    if ([str isEqualToString:@"+"]) {
        operator = 1;
    } else if ([str isEqualToString:@"-"]) {
        operator = 2;
    } else if ([str isEqualToString:@"*"]) {
        operator = 3;
    } else if ([str isEqualToString:@"/"]) {
        operator = 4;
    }
}

- (IBAction)eqButton:(UIButton *)sender {
    [self doEquals];
}

- (IBAction)clearButton:(UIButton *)sender {
    current = @"0";
    previous = [current copy];
    operator = 0;
    [theTotal setText:current];
}

- (IBAction)decimalButton:(UIButton *)sender {
    NSRange range = [current rangeOfString:@"."options:(NSCaseInsensitiveSearch)];
    if (range.location == NSNotFound) {
        current = [current stringByAppendingString:@"."];
    }
    [theTotal setText:current];
}

- (void) doEquals {
    if (operator >= 1 && operator <= 4) {
        NSDecimalNumber *num1 = 0;
        num1 = [NSDecimalNumber decimalNumberWithString:previous];
        NSDecimalNumber *num2 = 0;
        num2 = [NSDecimalNumber decimalNumberWithString:current];
        if (operator == 1) {
            num1 = [num1 decimalNumberByAdding:num2];
            current = [NSString stringWithString:[num1 stringValue]];
        } else if (operator == 2) {
            num1 = [num1 decimalNumberBySubtracting:num2];
            current = [NSString stringWithString:[num1 stringValue]];
        } else if (operator == 3) {
            num1 = [num1 decimalNumberByMultiplyingBy:num2];
            current = [NSString stringWithString:[num1 stringValue]];
        } else if (operator == 4) {
            if (![current isEqualToString:@"0"]) {
                num1 = [num1 decimalNumberByDividingBy:num2];
                current = [NSString stringWithString:[num1 stringValue]];
            }
        }
        [theTotal setText:current];
        previous = [current copy];
        current = @"0";
        operator = 5;
    }
}
@end
