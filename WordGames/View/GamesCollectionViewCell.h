//
//  GamesCollectionViewCell.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GamesCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageForEachGame;
@property (weak, nonatomic) IBOutlet UITextView *textForEachGame;

- (void)setImageForEachGame:(UIImage *)imageForEachGame andTitleForEachGame:(NSString *) title;

@end

NS_ASSUME_NONNULL_END
