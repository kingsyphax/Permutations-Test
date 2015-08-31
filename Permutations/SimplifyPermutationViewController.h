//
//  SimplifyPermutationViewController.h
//  Permutations
//
//  Created by Nicholas Ward on 4/16/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PermutationsModel.h"

@interface SimplifyPermutationViewController : UIViewController<UITextFieldDelegate>
{
    PermutationsModel* model;
}

@property (weak, nonatomic) IBOutlet UILabel* simplifyLabel;

@property (weak, nonatomic) IBOutlet UITextField* toSimplify;

@property (weak, nonatomic) IBOutlet UIButton* submitSimplify;

@property (weak, nonatomic) IBOutlet UILabel* simplifiedOutput;

-(IBAction)simplifySubmitted:(UIButton*)sender;

-(void) dealWithSimplify;

@end
