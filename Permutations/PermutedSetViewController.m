//
//  ViewController.m
//  Permutations
//
//  Created by Nicholas Ward on 3/5/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "PermutedSetViewController.h"

@implementation PermutedSetViewController

@synthesize permutedSetLabel;
@synthesize permutedSet;
@synthesize submitPermutedSet;
@synthesize permutedSetOutput;

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

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dealWithPermutedSet];
    
    return YES;
}

-(void) dealWithPermutedSet {
    NSString* permutedSetString = permutedSet.text;
    
    NSArray* permutedSetArray = [permutedSetString componentsSeparatedByString:@", "];
    
    NSArray* permutation = [model permutationFromApplied:permutedSetArray];
    
    NSString* permutationString = [model permutationString:permutation];
    
    permutedSetOutput.text = permutationString;
}

@end
