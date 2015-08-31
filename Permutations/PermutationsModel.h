//
//  PermutationsModel.h
//  Permutations
//
//  Created by Nicholas Ward on 3/6/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PermutationsModel : NSObject

-(id) init;

-(int) gcdOfFirst:(int)x andSecond:(int) y;

-(int) gcdOfArray:(NSArray*)array;

-(int) lcmOfFirst:(int)x andSecond:(int) y;

-(int) lcmOfArray:(NSArray*)array;

-(BOOL) isTrivial:(NSArray*)permutation;

-(NSArray*) trivialPermutation;

-(BOOL) isValid:(NSArray*) scrambled;

-(NSArray*) permutationFromApplied:(NSArray*) applied;

-(NSArray*) applyPermutation:(NSArray*) permutation;

-(NSArray*) permutationFromString:(NSString*) permutationString;

-(NSString*) permutationString:(NSArray*) permutation;

-(int) permutationSize:(NSArray*) permutation;

-(NSArray*) actsUpon:(NSArray*) permutation;

-(NSArray*) asTranspositions:(NSArray*) permutation;

-(NSArray*) standardize:(NSArray*) permutation;

-(NSArray*) cycleLengths:(NSArray*) permutation;

-(int) order:(NSArray*) permutation;

-(NSArray*) composeLeftPermutation:(NSArray*) left withRightPermutation:(NSArray*) right;

-(NSArray*) composePermutations:(NSArray*) arrayOfPermutations;

-(NSArray*) raisePermutation:(NSArray*) permutation toPower:(int) power;

-(NSArray*) generateFrom:(NSArray*) arrayOfPermutations;

-(NSArray*) generateFromFirstPermutation:(NSArray*) first andSecondPermutation:(NSArray*) second;

-(NSArray*) simplify:(NSArray*) permutation;

-(BOOL) isEven:(NSArray*) permutation;

@end
