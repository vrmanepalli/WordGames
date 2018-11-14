//
//  ClueObject.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/13/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DownloadCompleteProtocol <NSObject>

- (void) downloadingClueCompleted: (NSMutableArray *) responseArray;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ClueObject : NSObject

@property (nonatomic, strong) id <DownloadCompleteProtocol> delegate;

@property (nonatomic, strong) NSString *clue;

- (void) downloadNextClue;

@end

NS_ASSUME_NONNULL_END
