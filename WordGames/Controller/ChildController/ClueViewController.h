//
//  ClueViewController.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/14/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClueObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClueViewController : UIViewController <DownloadCompleteProtocol>

@property (weak, nonatomic) IBOutlet UIButton *btnNextClue;
@property (weak, nonatomic) IBOutlet UILabel *lblClue;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)btnNextClueIsPressed:(id)sender;

@property (strong, nonatomic) ClueObject *clueObj;

- (void) loadNextClue;

@end

NS_ASSUME_NONNULL_END
