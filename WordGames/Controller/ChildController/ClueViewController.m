//
//  ClueViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/14/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "ClueViewController.h"
#import "UIDesignUtility.h"

@interface ClueViewController ()

@end

@implementation ClueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!self.clueObj) {
        self.clueObj = [[ClueObject alloc] init];
    }
    self.clueObj.delegate = self;
    [self loadNextClue];
    [UIDesignUtility roundTheCorners:self.btnNextClue];
}

- (void) loadNextClue {
    [self.activityIndicator startAnimating];
    [self.clueObj downloadNextClue];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        self.lblClue.text = @"word";
    }];
}

- (void)downloadingClueCompleted:(NSMutableArray *) responseArray {
    int size = (int) [responseArray count];
    int randomInt = arc4random() % size;
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.activityIndicator stopAnimating];
        self.lblClue.text = [[responseArray objectAtIndex:randomInt] objectForKey:@"word"];
    }];
}

- (IBAction)btnNextClueIsPressed:(id)sender {
    [self loadNextClue];
}
@end
