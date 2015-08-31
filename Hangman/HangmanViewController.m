//
//  ViewController.m
//  Hangman
//
//  Created by Nicholas Ward on 3/5/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize picker;
@synthesize label;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerData = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    self.picker.delegate = self;
    self.picker.dataSource = self;
    
    model = [[HangmanModel alloc] init];
    
    label.text = [model currentGuessed];
    
    label.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView*)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _pickerData.count;
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _pickerData[row];
}

-(IBAction)goButtonClicked:(UIButton*)sender {
    [model guess:[_pickerData objectAtIndex:[picker selectedRowInComponent:0]]];
    
    label.text = [model currentGuessed];
}

@end
