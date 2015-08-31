//
//  PermutationsModel.m
//  Permutations
//
//  Created by Nicholas Ward on 3/6/15.
//  Copyright (c) 2015 Pineapple Bears. All rights reserved.
//

#import "PermutationsModel.h"

@implementation PermutationsModel

-(id) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

/*
def gcd_of_two(x, y):
	if y > x:
        return gcd_of_two(y, x)
	if y == 0:
        return x
	return gcd_of_two(y, x % y)
*/
-(int) gcdOfFirst:(int)x andSecond:(int) y {
    if (y > x) {
        return [self gcdOfFirst:y andSecond:x];
    }
    if (y == 0) {
        return x;
    }
    return [self gcdOfFirst:y andSecond:(x%y)];;
}

/*
def gcd(*nums):
	gcd_so_far = nums[0]
	for i in range(1, len(nums)):
        gcd_so_far = gcd_of_two(gcd_so_far, nums[i])
	return gcd_so_far
*/
-(int) gcdOfArray:(NSArray*)array {
    int gcdSoFar = (int) [array objectAtIndex:0];
    for (int index = 1; index < [array count]; index++) {
        gcdSoFar = [self gcdOfFirst:gcdSoFar andSecond:(int)[array objectAtIndex:index]];
    }
    return gcdSoFar;
}

/*
def lcm_of_two(x, y):
	return x * y // gcd(x, y)
*/
-(int) lcmOfFirst:(int)x andSecond:(int) y {
    return x * y / [self gcdOfFirst:x andSecond:y];
}

/*
def lcm(*nums):
	lcm_so_far = nums[0]
	for i in range(1, len(nums)):
        lcm_so_far = lcm_of_two(lcm_so_far, nums[i])
	return lcm_so_far
*/
-(int) lcmOfArray:(NSArray*)array {
    int lcmSoFar = (int) [array objectAtIndex:0];
    for (int index = 1; index < [array count]; index++) {
        lcmSoFar = [self lcmOfFirst:lcmSoFar andSecond:(int)[array objectAtIndex:index]];
    }
    return lcmSoFar;
}

/*
def is_trivial(permutation):
	return len(permutation) == 0
*/
-(BOOL) isTrivial:(NSArray*)permutation {
    return [permutation count] == 0;
}

/*
def trivial_permutation():
	return ()
*/
-(NSArray*) trivialPermutation {
    return [NSArray array];
}

/*
def is_valid(scrambled):
	return sorted(scrambled) == list(range(1, max(scrambled) + 1))
*/
-(BOOL) isValid:(NSArray*) scrambled {
    int max = -1;
    for (int index = 0; index < [scrambled count]; index++) {
        if ((int) ([scrambled objectAtIndex:index]) > max) {
            max = (int) ([scrambled objectAtIndex:index]);
        }
    }
    
    for (int element = 1; element <= max; element++) {
        BOOL found = NO;
        for (int index = 0; index < [scrambled count]; index++) {
            if ((int) ([scrambled objectAtIndex:index]) == element) {
                found = YES;
            }
        }
        if (!found) {
            return NO;
        }
    }
    
    return YES;
}

/*
def permutation_from_applied(applied):
	cycles = []
	for i in range(1, len(applied) + 1):
        if i not in sum(cycles, ()):
            cycle = [i]
            x = applied[i - 1]
            while x != i:
                cycle.append(x)
                x = applied[x - 1]
            if len(cycle) > 1:
                cycles.append(tuple(cycle))
    return tuple(cycles)
*/
-(NSArray*) permutationFromApplied:(NSArray*) applied {
    NSMutableArray* cycles = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= [applied count]; i++) {
        BOOL inCycles = NO;
        for (int index = 0; index < [cycles count]; index++) {
            for (int jndex = 0; jndex < [[cycles objectAtIndex:index] count]; jndex++) {
                if ([[[cycles objectAtIndex:index] objectAtIndex:jndex] integerValue] == i) {
                    inCycles = YES;
                }
            }
        }

        if (!inCycles) {
            
            NSMutableArray* newCycle = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:i], nil];
            
            int x = [[applied objectAtIndex:i-1] integerValue];
            
            while (x != i) {
                [newCycle addObject:[NSNumber numberWithInt:x]];

                x = [[applied objectAtIndex:x-1] integerValue];
            }
            
            if ([newCycle count] > 1) {
                [cycles addObject:newCycle];
            }
        }
    }
    
    return [[NSArray alloc] initWithArray:cycles];
}

/*
def apply_permutation(permutation):
	def permutation_size_raw(permutation):
        return max(sum(permutation, ()))

	def acts_upon_raw(permutation):
        return tuple(range(1, permutation_size_raw(permutation) + 1))
	
	seq = acts_upon_raw(permutation)
	for cycle in permutation[::-1]:
        newseq = []
        for i in range(1, len(seq) + 1):
            if i in cycle:
                applied_position = cycle[(cycle.index(i) + 1) % len(cycle)]
                newseq.append(seq[applied_position - 1])
            else:
                newseq.append(seq[i - 1])
        seq = newseq
    return tuple(seq)
*/
-(NSArray*) applyPermutation:(NSArray*) permutation {
    int max = -1;
    
    for (int index = 0; index < [permutation count]; index++) {
        NSArray* cycle = [permutation objectAtIndex:index];
        for (int jndex = 0; jndex < [cycle count]; jndex++) {
            int element = [[cycle objectAtIndex:jndex] intValue];
            if (element > max) {
                max = element;
            }
        }
    }
    
    NSMutableArray* seq = [[NSMutableArray alloc] init];
    
    for (int x = 1; x <= max; x++) {
        [seq addObject:[NSNumber numberWithInt:x]];
    }
    
    for (int index = [permutation count] - 1; index >= 0; index--) {
        NSArray* cycle = [permutation objectAtIndex:index];
        
        NSMutableArray* newSeq = [[NSMutableArray alloc] init];
        
        for (int i = 1; i <= [seq count]; i++) {
            int indexInCycle = -1;
            for (int j = 0; j < [cycle count]; j++) {
                if ([[cycle objectAtIndex:j] intValue] == i) {
                    indexInCycle = j;
                }
            }
            if (indexInCycle > -1) {
                int appliedPosition = [[cycle objectAtIndex:((indexInCycle + 1) % [cycle count])] intValue];
                [newSeq addObject:[seq objectAtIndex:appliedPosition-1]];
            } else {
                [newSeq addObject:[seq objectAtIndex:i-1]];
            }
        }
        
        seq = newSeq;
    }
    
    return seq;
}

/*
def permutation_string(permutation):
    if is_trivial(permutation):
        return "1"
    cycle_strings = []
    for cycle in permutation:
        cycle_strings.append("(" + " ".join([str(x) for x in cycle]) + ")")
    return " ".join(cycle_strings)
*/
-(NSString*) permutationString:(NSArray*) permutation {
    if ([self isTrivial:permutation]) {
        return @"1";
    }
    
    NSMutableString* cyclesString = [[NSMutableString alloc] initWithString:@""];
    
    for (int index = 0; index < [permutation count]; index++) {
        [cyclesString appendString:@"("];
        for (int jndex = 0; jndex < [[permutation objectAtIndex:index] count]; jndex++) {
            [cyclesString appendFormat:@"%d ", (int)[[[permutation objectAtIndex:index] objectAtIndex:jndex] integerValue]];
        }
        [cyclesString setString:[cyclesString substringToIndex:[cyclesString length] - 1]]; // cut off last space
        [cyclesString appendString:@") "];
    }
    [cyclesString setString:[cyclesString substringToIndex:[cyclesString length] - 1]]; // cut off last space
    
    return cyclesString;
}

/*
def permutation_from_string(cycles_string):
    cycles_string = cycles_string.strip()
    if cycles_string == "1":
        return trivial_permutation()
	pieces = re.split(r'\)\s*\(', cycles_string)
	pieces = [s.strip("() ") for s in pieces]
	pieces = [s.split(" ") for s in pieces]
	pieces = [[int(x) for x in l] for l in pieces]
	pieces = tuple([tuple(l) for l in pieces])
	return pieces
*/
-(NSArray*) permutationFromString:(NSString*) permutationString {
    permutationString = [permutationString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([permutationString isEqualToString:@"1"]) {
        return [self trivialPermutation];
    }
    
    NSMutableArray* pieces = [[NSMutableArray alloc] initWithArray:[permutationString componentsSeparatedByString:@") ("]];
    for (int pieceIndex = 0; pieceIndex < [pieces count]; pieceIndex++) {
        NSString* old = [pieces objectAtIndex:pieceIndex];
        NSString* new = [old stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"() "]];
        
        NSMutableArray* newArray = [[NSMutableArray alloc] initWithArray:[new componentsSeparatedByString:@" "]];
        for (int arrayIndex = 0; arrayIndex < [newArray count]; arrayIndex++) {
            int value = [[newArray objectAtIndex:arrayIndex] intValue];
            [newArray setObject:[NSNumber numberWithInt:value] atIndexedSubscript:arrayIndex];
        }
        
        [pieces setObject:newArray atIndexedSubscript:pieceIndex];
    }
    
    return pieces;
}

/*
def permutation_size(permutation):
	if is_trivial(permutation):
        return 0
	permutation = simplify(permutation)
	return max(sum(permutation, ()))
*/
-(int) permutationSize:(NSArray*) permutation {
    if ([self isTrivial:permutation]) {
        return 0;
    }
    int max = -1;
    permutation = [self simplify:permutation];
    for (int cycleIndex = 0; cycleIndex < [permutation count]; cycleIndex++) {
        NSArray* cycle = [permutation objectAtIndex:cycleIndex];
        for (int elementIndex = 0; elementIndex < [cycle count]; elementIndex++) {
            int element = (int)[cycle objectAtIndex:elementIndex];
            if (element > max) {
                max = element;
            }
        }
    }
    
    return max;
}

/*
def acts_upon(permutation):
	return tuple(range(1, permutation_size(permutation) + 1))
*/
-(NSArray*) actsUpon:(NSArray*) permutation {
    NSMutableArray* actedUpon = [[NSMutableArray alloc] init];
    int size = [self permutationSize:permutation];
    for (int i = 1; i <= size; i++) {
        [actedUpon addObject:@(i)];
    }
    return actedUpon;
}

/*
def as_transpositions(permutation):
	permutation = simplify(permutation)
	permutation = list(permutation)
	i = 0
	while i < len(permutation):
        cycle = permutation[i]
        if len(cycle) > 2:
            transpositions = [(cycle[i], cycle[i+1]) for i in range(len(cycle) - 1)]
            permutation = permutation[:i] + transpositions + permutation[i+1:]
            i += len(transpositions)
        else:
            i += 1
	return tuple(permutation)
*/
-(NSArray*) asTranspositions:(NSArray*) permutation {
    //FIXME
    return nil;
}

/*
def standardize(permutation):
	permutation = list(permutation)
	for i in range(len(permutation)):
        cycle = permutation[i]
        size = len(cycle)

        lowest = min(cycle)
        lowest_index = cycle.index(lowest)

        new_cycle = []

        for j in range(size):
            new_cycle.append(cycle[(lowest_index + j) % size])

        permutation[i] = tuple(new_cycle)

	permutation = sorted(permutation, key = lambda cycle: cycle[0])
	return tuple(permutation)
*/
-(NSArray*) standardize:(NSArray*) permutation {
    NSMutableArray* newPermutation = [[NSMutableArray alloc] arrayByAddingObjectsFromArray:permutation];
    
    for (int cycleIndex = 0; cycleIndex < [newPermutation count]; cycleIndex++) {
        NSArray* cycle = [newPermutation objectAtIndex:cycleIndex];

        int size = (int)[cycle count];

        int minIndex = -1;
        
        for (int index = 0; index < size; index++) {
            if (minIndex == -1 ||
                  [[cycle objectAtIndex:index] intValue] < [[cycle objectAtIndex:minIndex] intValue]) {
                minIndex = index;
            }
        }
        
        NSMutableArray* newCycle = [[NSMutableArray alloc] init];
        
        int currentIndex = minIndex;
        for (int i = 0; i < size; i++) {
            [newCycle addObject:[cycle objectAtIndex:currentIndex]];
            currentIndex = (currentIndex + 1) % size;
        }
        
        [newPermutation replaceObjectAtIndex:cycleIndex withObject:cycle];
    }
    
    newPermutation = [newPermutation sortedArrayUsingComparator:^(NSArray* obj1, NSArray* obj2) {
        if ([[obj1 objectAtIndex:0] intValue] > [[obj2 objectAtIndex:0] intValue]) {
            return (NSComparisonResult) NSOrderedDescending;
        }
        
        if ([[obj1 objectAtIndex:0] intValue] < [[obj2 objectAtIndex:0] intValue]) {
            return (NSComparisonResult) NSOrderedAscending;
        }
        
        return (NSComparisonResult) NSOrderedSame;
    }];
    
    return newPermutation;
}

/*
def cycle_lengths(permutation):
	permutation = simplify(permutation)
	return [len(cycle) for cycle in permutation]
*/
-(NSArray*) cycleLengths:(NSArray*) permutation {
    permutation = [self simplify:permutation];
    
    NSMutableArray* lengths = [[NSMutableArray alloc] init];
    
    for (int cycleIndex = 0; cycleIndex < [permutation count]; cycleIndex++) {
        NSArray* cycle = [permutation objectAtIndex:cycleIndex];
        [lengths addObject:[NSNumber numberWithInteger:[cycle count]]];
    }
    
    return lengths;
}

/*
def order(permutation):
	return lcm(*cycle_lengths(permutation))
*/
-(int) order:(NSArray*) permutation {
    return [self lcmOfArray:[self cycleLengths:permutation]];
}

/*
def compose_two_permutations(left, right):
	largest = max(permutation_size(left), permutation_size(right))
	
	act_upon = list(range(1, largest + 1))
	
	righted = []
	for i in act_upon:
        found = False
        for cycle in right[::-1]:
            if i in cycle:
                found = True
                righted.append(cycle[(cycle.index(i) + 1) % len(cycle)])
        if not found:
            righted.append(i)
	
	lefted = []
	for i in righted:
        found = False
        for cycle in left[::-1]:
            if i in cycle:
                found = True
                lefted.append(cycle[(cycle.index(i) + 1) % len(cycle)])
        if not found:
            lefted.append(i)
	
	return permutation_from_applied(lefted)
*/
-(NSArray*) composeLeftPermutation:(NSArray*) left withRightPermutation:(NSArray*) right {
    NSArray* righted = [self applyPermutation:right];
    
    NSMutableArray* lefted = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < [righted count]; index++) {
        int i = [[righted objectAtIndex:index] intValue];
        
        BOOL found = NO;
        for (int leftIndex = 0; leftIndex < [left count]; leftIndex++) {
            NSArray* cycle = [left objectAtIndex:leftIndex];
            int positionInCycle = -1;
            for (int cycleIndex = 0; cycleIndex < [cycle count]; cycleIndex++) {
                if ([[cycle objectAtIndex:cycleIndex] intValue] == i) {
                    positionInCycle = cycleIndex;
                    found = YES;
                }
            }
            if (positionInCycle > -1) {
                [lefted addObject:[cycle objectAtIndex:((positionInCycle + 1) % [cycle count])]];
            }
        }
        if (!found) {
            [lefted addObject:[NSNumber numberWithInt:i]];
        }
    }
    
    return [self permutationFromApplied:lefted];
}

/*
def compose_permutations(*permutations):
	if len(permutations) == 0:
        return trivial_permutation()
	permutations = list(permutations)
	while len(permutations) > 1:
        last_two = permutations[-2:]
        last = compose_two_permutations(*last_two)
        permutations = permutations[:-2] + [last]
	return permutations[0]
*/
-(NSArray*) composePermutations:(NSArray*) arrayOfPermutations {
    if ([arrayOfPermutations count] == 0) {
        return [self trivialPermutation];
    }
    
    NSMutableArray* permutations = [NSMutableArray arrayWithArray:arrayOfPermutations];
    
    while ([permutations count] > 1) {
        NSArray* penultimate = [permutations objectAtIndex:([permutations count] - 2)];
        NSArray* final = [permutations objectAtIndex:([permutations count] - 1)];
        
        NSArray* composed = [self composeLeftPermutation:penultimate withRightPermutation:final];
        
        permutations = [NSMutableArray arrayWithArray:[permutations subarrayWithRange:NSMakeRange(0, [permutations count] - 2)]];
        [permutations addObject:composed];
    }
    
    return [permutations objectAtIndex:0];
}

/*
def permutation_to_power(permutation, power):
	return compose_permutations(*([permutation] * power))
*/
-(NSArray*) raisePermutation:(NSArray*) permutation toPower:(int) power {
    NSMutableArray* permutations = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < power; i++) {
        [permutations addObject:permutations];
    }
    
    return [self composePermutations:permutations];
}

/*
def generate(*permutations):
	permutations = [simplify(permutation) for permutation in permutations]
	
	generated = [trivial_permutation()]
	
	for permutation in permutations:
        powers = []
        for p in range(order(permutation)):
            powers.append(permutation_to_power(permutation, p))

        for a in generated:
            for b in powers:
                product = simplify(compose_two_permutations(a, b))
                if product not in generated:
                    generated.append(product)
	
	return generated
*/
-(NSArray*) generateFrom:(NSArray*) arrayOfPermutations {
    NSMutableArray* permutations = [NSMutableArray arrayWithArray:arrayOfPermutations];
    
    NSMutableArray* generated = [[NSMutableArray alloc] init];
    [generated addObject:[self trivialPermutation]];
    
    for (int permutationIndex = 0; permutationIndex < [permutations count]; permutationIndex++) {
        NSArray* permutation = [permutations objectAtIndex:permutationIndex];
        
        for (int generatedIndex = 0; generatedIndex < [generated count]; generatedIndex++) {
            NSArray* a = [generated objectAtIndex:generatedIndex];
            
            for (int p = 0; p < [self order:permutation]; p++) {
                NSArray* b = [self raisePermutation:permutation toPower:p];
                
                NSArray* product = [self simplify:[self composeLeftPermutation:a withRightPermutation:b]];
                
                BOOL inGenerated = NO;
                for (int otherGeneratedIndex = 0; otherGeneratedIndex < [generated count]; otherGeneratedIndex++) {
                    if ([[generated objectAtIndex:otherGeneratedIndex] isEqualToArray:product]) {
                        inGenerated = YES;
                    }
                }
                if (!inGenerated) {
                    [generated addObject:product];
                }
            }
        }
    }
    
    return generated;
}

/*
def generate_from_two(first_permutation, second_permutation):
	first_permutation = simplify(first_permutation)
	second_permutation = simplify(second_permutation)
	
	powers_of_first = []
	for p in range(order(first_permutation)):
        powers_of_first.append(permutation_to_power(first_permutation, p))

	powers_of_second = []
	for p in range(order(second_permutation)):
        powers_of_second.append(permutation_to_power(second_permutation, p))
	
	generated = []
	for a in powers_of_first:
        for b in powers_of_second:
            product = compose_two_permutations(a, b)
            if product not in generated:
                generated.append(product)
	
	return generated
*/
-(NSArray*) generateFromFirstPermutation:(NSArray*) first andSecondPermutation:(NSArray*) second {
    return nil;
}

/*
def simplify(permutation):
	if is_trivial(permutation):
        return trivial_permutation()
	
	return permutation_from_applied(apply_permutation(permutation))
*/
-(NSArray*) simplify:(NSArray*) permutation {
    if ([self isTrivial:permutation]) {
        return [self trivialPermutation];
    }
    
    return [self permutationFromApplied:[self applyPermutation:permutation]];
}

/*
def iseven(permutation):
	return len(as_transpositions(permutation)) % 2 == 0
*/
-(BOOL) isEven:(NSArray*) permutation {
    return [[self asTranspositions:permutation] count] % 2 == 0;
}

@end
