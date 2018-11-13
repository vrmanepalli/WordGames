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
        
        self.soundPlayObject = [[SoundPlayUtility alloc] init];
        
        self.soundPlayObject.delegate = self;
        
        self.soundFile = [[NSBundle mainBundle] pathForResource:@"beep-hightone" ofType:@"aif" inDirectory:@"beeps"];
        
        [self.soundPlayObject prepareAndPlayAudioPlayerWithFile:self.soundFile];
    }
    
}

#pragma mark - Segue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.destinationViewController isKindOfClass:[SoundSelectionTableViewController class]]) {
        
        SoundSelectionTableViewController *soundSelectionVC = segue.destinationViewController;
        soundSelectionVC.delegate = self;
        soundSelectionVC.soundRowKey = [self.gameDetails objectForKey:SOUND_ROW_KEY];
        soundSelectionVC.soundSectionKey = [self.gameDetails objectForKey:SOUND_SECTION_KEY];
    }
    
}

#pragma mark - SoundSelectionDelegate Method

- (void)useSoundFile:(nonnull NSString *)filePath {
    self.soundFile = filePath;
}

- (void)roundCompleted {
    NSLog(@"Round completed.");
}

@end
