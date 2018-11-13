//
//  SoundPlayUtility.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/13/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "SoundPlayUtility.h"

@implementation SoundPlayUtility

- (instancetype)init {
    
    if(!self) {
        self = [[SoundPlayUtility alloc] init];
    }
    self.isRunning = true;
    self.repeatFor = 135;
    self.dispatchInterval = 1.0;
    return self;
    
}

- (void)prepareAndPlayAudioPlayerWithFile:(NSString *)audioFilePath {
    
    NSURL *soundURL = [NSURL fileURLWithPath:audioFilePath];
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
                [weakSelf.delegate roundCompleted];
            }
        }
    });
    [audioPlayer play];
}

@end
