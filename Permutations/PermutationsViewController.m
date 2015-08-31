//
//  ViewController.m
//  Permutations
//
//  Created by Nicholas Ward on 3/5/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "PermutationsViewController.h"

@implementation PermutationsViewController

@synthesize applyLabel;
@synthesize toApply;
@synthesize submitApply;
@synthesize appliedOutput;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.permutedSet.delegate = self;
    
    model = [[PermutationsModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)permutedSetSubmitted:(UIButton*)sender {
    [self dealWithPermutedSet];
}

/*-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dealWithPermutedSet];
    
    return YES;
}*/

-(void) dealWithPermutedSet {
    NSString* permutedSetString = permutedSet.text;
    
    NSArray* permutedSetArray = [permutedSetString componentsSeparatedByString:@", "];
    
    NSArray* permutation = [model permutationFromApplied:permutedSetArray];
    
    NSString* permutationString = [model permutationString:permutation];
    
    permutedSetOutput.text = permutationString;
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
