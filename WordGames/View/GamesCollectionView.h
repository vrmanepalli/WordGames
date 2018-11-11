//
//  GamesCollectionView.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GamesCollectionView : UICollectionView

@property (nonatomic) int selectedIndex;

@property (nonatomic, strong) NSArray *games;

- (NSDictionary *) getSelectedGameObject;

@end

NS_ASSUME_NONNULL_END
