//
//  SuperGameViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/9/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "SuperGameViewController.h"
#import "UIDesignUtility.h"
#import "GamesDetailsObject.h"

@interface SuperGameViewController ()

@end

@implementation SuperGameViewController

#pragma mark - Callback Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeGame];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.scoreBoardView loadScoresFromUserDefaults];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [self.scoreBoardView saveScoresToUserDefaults];
    
}

#pragma mark - Instance Methods
- (void) initializeGame {
    
    if(self.gameDetails) {
        [self setTitle:[self.gameDetails objectForKey:GAME_TITLE]];
        
        [self.scoreBoardView initializeWithGameKey1:[self.gameDetails objectForKey:SCORE_TEAM_1_KEY] andGameKey2:[self.gameDetails objectForKey:SCORE_TEAM_2_KEY]];
    }
    
}

@end
