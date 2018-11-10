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

@property (weak, nonatomic) IBOutlet UILabel *lblTeam1Score;
@property (weak, nonatomic) IBOutlet UILabel *lblTeam2Score;

@end

NS_ASSUME_NONNULL_END
