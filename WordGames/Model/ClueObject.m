//
//  ClueObject.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/13/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

/*
 
 
 E    11.1607%    56.88    M    3.0129%    15.36
 A    8.4966%    43.31    H    3.0034%    15.31
 R    7.5809%    38.64    G    2.4705%    12.59
 I    7.5448%    38.45    B    2.0720%    10.56
 O    7.1635%    36.51    F    1.8121%    9.24
 T    6.9509%    35.43    Y    1.7779%    9.06
 N    6.6544%    33.92    W    1.2899%    6.57
 S    5.7351%    29.23    K    1.1016%    5.61
 L    5.4893%    27.98    V    1.0074%    5.13
 C    4.5388%    23.13    X    0.2902%    1.48
 U    3.6308%    18.51    Z    0.2722%    1.39
 D    3.3844%    17.25    J    0.1965%    1.00
 P    3.1671%
 
 */

#import "ClueObject.h"

@implementation ClueObject

- (void)downloadNextClue {
    
    [[[NSOperationQueue alloc] init] addOperationWithBlock:^{
        int randomNumber = arc4random() % 100;
        NSString *randomAlphabet = [self findRandomAlphabetWithRandomNum:randomNumber];
        NSString *urlString = [NSString stringWithFormat:@"https://api.datamuse.com/words?max=1000&sp=*%@*", randomAlphabet];
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSError *error;
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if(error) {
            
        } else {
            [self.delegate downloadingClueCompleted:json];
        }
    }];
    
}

- (NSString *) findRandomAlphabetWithRandomNum: (int) randomInt {
    
    if(randomInt <= 11) {
        return @"e";
    } else if(randomInt <= 20) {
        return @"a";
    } else if(randomInt <= 28) {
        return @"r";
    } else if(randomInt <= 36) {
        return @"i";
    } else if(randomInt <= 43) {
        return @"o";
    } else if(randomInt <= 50) {
        return @"t";
    } else if(randomInt <= 56) {
        return @"n";
    } else if(randomInt <= 61) {
        return @"s";
    } else if(randomInt <= 66) {
        return @"l";
    } else if(randomInt <= 70) {
        return @"c";
    } else if(randomInt <= 73) {
        return @"u";
    } else if(randomInt <= 76) {
        return @"d";
    } else if(randomInt <= 79) {
        return @"p";
    } else if(randomInt <= 82) {
        return @"m";
    } else if(randomInt <= 85) {
        return @"h";
    } else if(randomInt <= 88) {
        return @"g";
    } else if(randomInt <= 90) {
        return @"b";
    } else if(randomInt <= 92) {
        return @"f";
    } else if(randomInt <= 94) {
        return @"y";
    } else if(randomInt <= 95) {
        return @"w";
    } else if(randomInt <= 96) {
        return @"k";
    } else if(randomInt <= 97) {
        return @"v";
    } else if(randomInt <= 98) {
        return @"x";
    } else if(randomInt <= 99) {
        return @"z";
    } else {
        return @"q";
    }
    
}

@end
