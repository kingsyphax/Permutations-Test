//
//  SimplifyPermutationViewController.m
//  Permutations
//
//  Created by Nicholas Ward on 4/16/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "SimplifyPermutationViewController.h"

@implementation SimplifyPermutationViewController

@synthesize simplifyLabel;
@synthesize toSimplify;
@synthesize submitSimplify;
@synthesize simplifiedOutput;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toSimplify.delegate = self;
    
    model = [[PermutationsModel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)simplifySubmitted:(UIButton*)sender {
    [self dealWithSimplify];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self dealWithSimplify];
    
    return YES;
}

-(void) dealWithSimplify {
    NSString* toSimplifyString = toSimplify.text;
    
    NSArray* toSimplify = [model permutationFromString:toSimplifyString];
    
    NSArray* simplified = [model simplify:toSimplify];
    
    NSString* simplifiedString = [model permutationString:simplified];
    
    simplifiedOutput.text = simplifiedString;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
