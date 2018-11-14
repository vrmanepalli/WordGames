//
//  SoundPlayObject.m
//  WordGames
//
//
//  **********************
//
//  Its main usability is to play a sound for a minute with varying delays.
//  - Methods
//      init -> Initializes the variables that allows it to play sound for a minute with varying delays.
//      prepareAndPlayAudioPlayerWithFile -> Creates AVAudioPlayer with the desired Audio file and calls playSoundMethod.
//      playSound -> It dispatches a delayed call to itself as per its dispatchInterval and plays the sound once.
//                   It changes the dispatchInterval based on its value reaching milestones.
//                   Once the minute completes it will stop dispatching calls to itself, resets the settings and makes roundCompleted call to delegate.
//
//  **********************
//
//  Created by Vasudeva Manepalli on 11/13/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "SoundPlayObject.h"

@implementation SoundPlayObject

- (instancetype)initWithSoundFilePathKey: (NSString *) soundFilePathKey {
    
    if(!self) {
        self = [[SoundPlayObject alloc] init];
    }
    self.isRunning = true;
    self.repeatFor = 135;
    self.dispatchInterval = 1.0;
    self.audioFilePath = [[NSUserDefaults standardUserDefaults] objectForKey:soundFilePathKey];
    if(!self.audioFilePath) {
        self.audioFilePath = [[NSBundle mainBundle] pathForResource:@"beep-hightone" ofType:@"aif" inDirectory:@"beeps"];
        [self saveSoundFilePathToUserDefaultsWithKey:soundFilePathKey];
    }
    return self;
    
}

- (void)saveSoundFilePathToUserDefaultsWithKey: (NSString *) soundFilePathKey {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.audioFilePath forKey:soundFilePathKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)prepareAndPlayAudioPlayerWithFile {
    
    NSURL *soundURL = [NSURL fileURLWithPath:self.audioFilePath];
    NSError *error = nil;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    [audioPlayer prepareToPlay];
    [self playSound:audioPlayer];
    
}

- (void)playSound: (AVAudioPlayer *) audioPlayer {
    
    __weak __typeof__(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.dispatchInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.repeatFor--;
        if (weakSelf.isRunning){
            if(weakSelf.repeatFor > 0) {
                if(weakSelf.repeatFor == 131) {
                    weakSelf.dispatchInterval = 0.85;
                } else if(weakSelf.repeatFor == 127) {
                    weakSelf.dispatchInterval = 0.75;
                } else if(weakSelf.repeatFor == 121) {
                    weakSelf.dispatchInterval = 0.65;
                } else if(weakSelf.repeatFor == 109) {
                    weakSelf.dispatchInterval = 0.55;
                } else if(weakSelf.repeatFor == 97) {
                    weakSelf.dispatchInterval = 0.45;
                } else if(weakSelf.repeatFor == 79) {
                    weakSelf.dispatchInterval = 0.35;
                } else if(weakSelf.repeatFor == 49) {
                    weakSelf.dispatchInterval = 0.25;
                } else if(weakSelf.repeatFor == 30) {
                    weakSelf.dispatchInterval = 0.17;
                }
                [weakSelf playSound: audioPlayer];
            } else {
                weakSelf.isRunning = true;
                weakSelf.repeatFor = 135;
                weakSelf.dispatchInterval = 1.0;
                [weakSelf.delegate roundCompleted];
            }
        }
    });
    [audioPlayer play];
}

@end
