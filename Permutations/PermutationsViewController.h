//
//  ViewController.h
//  Permutations
//
//  Created by Nicholas Ward on 3/5/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PermutationsModel.h"

@interface PermutationsViewController : UIViewController<UITextFieldDelegate>
{
    PermutationsModel* model;
}

@property (weak, nonatomic) IBOutlet UILabel* permutedSetLabel;

@property (weak, nonatomic) IBOutlet UITextField* permutedSet;

@property (weak, nonatomic) IBOutlet UIButton* submitPermutedSet;

@property (weak, nonatomic) IBOutlet UILabel* permutedSetOutput;

-(IBAction)permutedSetSubmitted:(UIButton*)sender;

@property (weak, nonatomic) IBOutlet UILabel* applyLabel;

@property (weak, nonatomic) IBOutlet UITextField* toApply;

@property (weak, nonatomic) IBOutlet UIButton* submitApply;

@property (weak, nonatomic) IBOutlet UILabel* appliedOutput;

-(IBAction) applySubmitted:(UIButton*)sender;

-(void) dealWithPermutedSet;

@end
