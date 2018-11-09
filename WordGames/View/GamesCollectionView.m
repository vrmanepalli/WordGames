//
//  GamesCollectionView.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "GamesCollectionView.h"
#import "GamesCollectionViewCell.h"

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
        _games = [[NSArray alloc] init];
    }
    
    return _games;
    
}

- (NSInteger)numberOfSections {
 
    return 1;
    
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    
    return 2;
    
}

- (UICollectionViewCell *)cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   GamesCollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    
    [cell setImageForEachGame:[UIImage imageNamed:@"test.jpg"] andTitleForEachGame:@"Test"];
    
    return cell;
}

@end
