//
//  SuperGameViewController.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/9/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreBoardView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SuperGameViewController : UIViewController

@property (nonatomic, strong) NSDictionary *gameDetails;

@property (weak, nonatomic) IBOutlet ScoreBoardView *scoreBoardView;

@end

NS_ASSUME_NONNULL_END
