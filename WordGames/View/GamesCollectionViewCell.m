//
//  GamesCollectionViewCell.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "GamesCollectionViewCell.h"
#import "UIDesignUtility.h"

@implementation GamesCollectionViewCell

- (instancetype)init {
    
    [UIDesignUtility roundTheCorners:self.imageForEachGame];
    [UIDesignUtility roundTheCorners:self.textForEachGame];
    return self;
    
}

- (void)setImageForEachGame:(UIImage *)imageForEachGame andTitleForEachGame:(NSString *) title {
    
    self.imageForEachGame.image = imageForEachGame;
    self.textForEachGame.text = title;
    
}

@end
