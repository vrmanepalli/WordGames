//
//  ScoreBoardViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/14/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "ScoreBoardViewController.h"
#import "UIDesignUtility.h"
#import "SuperGameViewController.h"

@interface ScoreBoardViewController ()

@end

@implementation ScoreBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIDesignUtility roundTheCorners:self.view];
    [self loadScoresFromUserDefaults];
}

- (void) loadScoresFromUserDefaults {
    
    self.team1Score = [[[NSUserDefaults standardUserDefaults] objectForKey:self.key1] intValue];
    self.team2Score = [[[NSUserDefaults standardUserDefaults] objectForKey:self.key2] intValue];
    
    [self displayScores];
    
}

- (void) saveScoresToUserDefaults {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.team1Score] forKey:self.key1];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.team2Score] forKey:self.key2];
    
}

- (void)incrementScoreForTeam1 {
    
    self.team1Score++;
    [self displayScores];
    
}

- (void)incrementScoreForTeam2 {
    
    self.team2Score++;
    [self displayScores];
    
}

- (void)displayScores {
    
    self.lblTeam1Score.text = [NSString stringWithFormat:@"Team 1: %d", 1];
    self.lblTeam2Score.text = [NSString stringWithFormat:@"Team 2: %d", self.team2Score];
    
}

@end
