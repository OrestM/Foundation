//
//  ViewController.m
//  TextFieldTest2
//
//  Created by Admin on 3/4/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.phoneNumber.returnKeyType = UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    /*
    NSLog(@"textField %@", textField.text);
    NSLog(@"shouldChangeCharactersInRange %@", NSStringFromRange(range));
    NSLog(@"replacementString %@", string);
    */
    
    NSCharacterSet *validationSet = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    NSArray *components = [string componentsSeparatedByCharactersInSet:validationSet];
    
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if ([components count] > 1) {
        return NO;
    }
    
    NSLog(@"new string %@", newString);
    
    NSArray *vallidComponents = [newString componentsSeparatedByCharactersInSet:validationSet];
    newString = [vallidComponents componentsJoinedByString:@""];
    
    NSLog(@"new string fixed %@", newString);
    
    static const int localNumberMaxLenght = 7;
    static const int areaCodeNumberMaxLenght = 3;
    static const int countryCodeNumberMaxLenght = 3;
    
    if ([newString length] > localNumberMaxLenght + areaCodeNumberMaxLenght + countryCodeNumberMaxLenght) {
        return NO;
    }
    
    NSMutableString *formatNumber = [NSMutableString string];
    
    NSInteger localNumberLenght = MIN([newString length], localNumberMaxLenght);
    
    if (localNumberLenght > 0) {
        NSString *number = [newString substringFromIndex:(int)[newString length] - localNumberLenght];
        
        [formatNumber appendString:number];
        
        if ([formatNumber length] > 3) {
            [formatNumber insertString:@"-" atIndex:3];
        }
        if ([formatNumber length] > 6) {
            [formatNumber insertString:@"-" atIndex:6];
        }
    }
    
    if ([newString length] > localNumberMaxLenght) {
        NSInteger areaCodeLenght = MIN([newString length] - localNumberMaxLenght, areaCodeNumberMaxLenght);
        
        NSRange areaRange =
        NSMakeRange((int)[newString length] - localNumberMaxLenght - areaCodeLenght, areaCodeLenght);
        
        NSString *areaCode = [newString substringWithRange:areaRange];
        
        areaCode = [NSString stringWithFormat:@"(%@) ", areaCode];
        
        [formatNumber insertString:areaCode atIndex:0];
    }
    
    if ([newString length] > localNumberMaxLenght + areaCodeNumberMaxLenght) {
        NSInteger countryCodeLenght =
        MIN([newString length] - localNumberMaxLenght - areaCodeNumberMaxLenght, countryCodeNumberMaxLenght);
        
        NSRange countryRange = NSMakeRange(0, countryCodeLenght);
        
        NSString *countryCode = [newString substringWithRange:countryRange];
        
        countryCode = [NSString stringWithFormat:@"+%@ ", countryCode];
        
        [formatNumber insertString:countryCode atIndex:0];
    }
    
    textField.text = formatNumber;
    
    return NO;
}

@end
