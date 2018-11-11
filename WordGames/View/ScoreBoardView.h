//
//  ScoreBoardView.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/10/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScoreBoardView : UIView

#pragma mark - Instance Variables
@property (nonatomic, strong) NSString *key1;
@property (nonatomic, strong) NSString *key2;
@property (nonatomic) int team1Score;
@property (nonatomic) int team2Score;

#pragma mark - IBOutlets
@property (weak, nonatomic) IBOutlet UILabel *lblTeam1Score;
@property (weak, nonatomic) IBOutlet UILabel *lblTeam2Score;

#pragma mark - Methods
- (void)initializeWithGameKey1:(NSString *) gameKey1 andGameKey2: (NSString *) gameKey2;
- (void) loadScoresFromUserDefaults;
- (void) saveScoresToUserDefaults;
- (void)incrementScoreForTeam1;
- (void)incrementScoreForTeam2;
- (void)displayScores;

@end

NS_ASSUME_NONNULL_END
