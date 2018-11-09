//
//  GamesCollectionView.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "GamesCollectionView.h"
#import "GamesCollectionViewCell.h"
#import "UIDesignUtility.h"
#import "GamesDetailsObject.h"

static NSString *CELL_IDENTIFIER = @"GameCell";

@implementation GamesCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSArray *) games {
 
    if(!_games) {
        _games = [[GamesDetailsObject alloc] initializeWithGames];
    }
    
    return _games;
    
}

- (NSInteger)numberOfSections {
 
    return 1;
    
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    
    return [self.games count];
    
}

- (UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   GamesCollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    NSDictionary *gameItem = [self.games objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageNamed:[gameItem objectForKey:GAME_ICON]];
    NSString *title = [gameItem objectForKey:GAME_TITLE];
    [cell setImageForEachGame: image andTitleForEachGame:title];
    [UIDesignUtility roundTheCorners:cell];
    
    return cell;
}

-  (void)selectItemAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated scrollPosition:(UICollectionViewScrollPosition)scrollPosition {
    //Perform required setup.
}

@end
