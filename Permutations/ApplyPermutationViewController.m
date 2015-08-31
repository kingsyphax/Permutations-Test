//
//  ApplyPermutationViewController.m
//  Permutations
//
//  Created by Nicholas Ward on 4/14/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "ApplyPermutationViewController.h"

@implementation ApplyPermutationViewController

@synthesize applyLabel;
@synthesize toApply;
@synthesize submitApply;
@synthesize appliedOutput;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toApply.delegate = self;
    
    model = [[PermutationsModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dealWithApply];
 
    return YES;
}


-(IBAction) applySubmitted:(UIButton*)sender {
    [self dealWithApply];
}

-(void) dealWithApply {
    NSString* permutationToApplyString = toApply.text;
    
    NSArray* permutationToApply = [model permutationFromString:permutationToApplyString];
    
    NSArray* applied = [model applyPermutation:permutationToApply];
    
    NSString* appliedString = [applied componentsJoinedByString:@", "];
    
    appliedOutput.text = appliedString;
}


@end
