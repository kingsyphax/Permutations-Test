//
//  ApplyPermutationViewController.h
//  Permutations
//
//  Created by Nicholas Ward on 4/14/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PermutationsModel.h"

@interface ApplyPermutationViewController : UIViewController<UITextFieldDelegate>
{
    PermutationsModel* model;
}

@property (weak, nonatomic) IBOutlet UILabel* applyLabel;

@property (weak, nonatomic) IBOutlet UITextField* toApply;

@property (weak, nonatomic) IBOutlet UIButton* submitApply;

@property (weak, nonatomic) IBOutlet UILabel* appliedOutput;

-(IBAction) applySubmitted:(UIButton*)sender;

-(void) dealWithApply;

@end
