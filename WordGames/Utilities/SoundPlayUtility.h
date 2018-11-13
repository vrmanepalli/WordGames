//
//  SoundPlayUtility.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/13/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol SoundPlayCompleteProtocol <NSObject>

- (void) roundCompleted;

@end

NS_ASSUME_NONNULL_BEGIN

@interface SoundPlayUtility : NSObject

@property (nonatomic, weak) id <SoundPlayCompleteProtocol> delegate;

@property (nonatomic) BOOL isRunning;
@property (nonatomic) float dispatchInterval;
@property (nonatomic) int repeatFor;

- (void) prepareAndPlayAudioPlayerWithFile: (NSString *) audioFilePath;
- (void) playSound: (AVAudioPlayer *) audioPlayer;

@end

NS_ASSUME_NONNULL_END
