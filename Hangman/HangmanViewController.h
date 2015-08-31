//
//  ViewController.h
//  Hangman
//
//  Created by Nicholas Ward on 3/5/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanModel.h"

@interface HangmanViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *_pickerData;
    
    HangmanModel* model;
}

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UILabel *label;

-(IBAction)goButtonClicked:(UIButton*)sender;

@end

