//
//  ClueViewController.m
//  WordGames
/****************************
 This View Controller presents each clue, activity indicator and a button; which triggers and loads next clue on every click.
 METHODS:
 #Helper Methods
    - (void) loadNextClue -> This helps to trigger the download of a random word on a new queue.
    - (void)downloadingClueCompleted:(NSMutableArray *) responseArray -> This will update the Label on Main Queue when the download and parse of the random word is completed.
 #IBActions Methods
    - (IBAction)btnNextClueIsPressed:(id)sender -> This requires to download, parse and load the next in the label.
 ****************************/
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

#pragma mark - Helper Methods
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

#pragma mark - IBAction Methods
- (IBAction)btnNextClueIsPressed:(id)sender {
    [self loadNextClue];
}
@end
