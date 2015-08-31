//
//  RootViewController.m
//  Permutations
//
//  Created by Nicholas Ward on 4/14/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "RootViewController.h"
#import "PermutedSetViewController.h"
#import "ApplyPermutationViewController.h"
#import "SimplifyPermutationViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Permutation Things";
}

-(void) viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == 0) {
        PermutedSetViewController* newController = [[PermutedSetViewController alloc] initWithNibName:@"PermutedSetViewController" bundle:nil];
        
        [self.navigationController pushViewController:newController animated:YES];
    } else if ([indexPath row] == 1) {
        ApplyPermutationViewController* newController = [[ApplyPermutationViewController alloc] initWithNibName:@"ApplyPermutationViewController" bundle:nil];
        
        [self.navigationController pushViewController:newController animated:YES];
    } else if ([indexPath row] == 2) {
        SimplifyPermutationViewController* newController = [[SimplifyPermutationViewController alloc] initWithNibName:@"SimplifyPermutationViewController" bundle:nil];
        
        [self.navigationController pushViewController:newController animated:YES];
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    
    if ([indexPath row] == 0) {
        cell.textLabel.text = @"Permutation from permuted set";
    } else if ([indexPath row] == 1) {
        cell.textLabel.text = @"Apply permutation";
    } else if ([indexPath row] == 2) {
        cell.textLabel.text = @"Simplify permutation";
    }
    
    return cell;
}

@end
