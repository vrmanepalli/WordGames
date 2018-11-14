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
#import "ScoreBoardViewController.h"

@interface SuperGameViewController ()

@end

@implementation SuperGameViewController

#pragma mark - Callback Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeGame];
}

#pragma mark - Instance Methods
- (void) initializeGame {
    
    if(self.gameDetails) {
        [self setTitle:[self.gameDetails objectForKey:GAME_TITLE]];
        [self initializeSound];
    }
    
}

- (void) initializeSound {
    
    self.soundPlayObject = [[SoundPlayObject alloc] initWithSoundFilePathKey:[self.gameDetails objectForKey:SOUND_FILE_PATH_KEY]];
    [self.soundPlayObject prepareAndPlayAudioPlayerWithFile];
    
}

#pragma mark - Segue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.destinationViewController isKindOfClass:[SoundSelectionTableViewController class]]) {
        
        SoundSelectionTableViewController *soundSelectionVC = segue.destinationViewController;
        soundSelectionVC.delegate = self;
        soundSelectionVC.soundRowKey = [self.gameDetails objectForKey:SOUND_ROW_KEY];
        soundSelectionVC.soundSectionKey = [self.gameDetails objectForKey:SOUND_SECTION_KEY];
        soundSelectionVC.soundFilePathKey = [self.gameDetails objectForKey:SOUND_FILE_PATH_KEY];
        
    } else if([segue.identifier isEqualToString:@"SegueToScoreBoardViewController"]) {
        ScoreBoardViewController *scoreBoard = segue.destinationViewController;
        scoreBoard.key1 = [self.gameDetails objectForKey:SCORE_TEAM_1_KEY];
        scoreBoard.key2 = [self.gameDetails objectForKey:SCORE_TEAM_2_KEY];
    }
    
}

#pragma mark - SoundSelectionDelegate Method

- (void)useSoundFile:(nonnull NSString *)filePath {
    
    self.soundFile = filePath;
    [self saveSoundFilePathToUserDefaults];
    [self initializeSound];
    
}

- (void)saveSoundFilePathToUserDefaults {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.soundFile forKey:[self.gameDetails objectForKey:SOUND_FILE_PATH_KEY]];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)roundCompleted {
    NSLog(@"Round completed.");
}

@end
