//
//  GamesCollectionViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/12/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "GamesCollectionViewController.h"
#import "GamesCollectionViewCell.h"
#import "GamesDetailsObject.h"
#import "UIDesignUtility.h"
#import "SuperGameViewController.h"

@interface GamesCollectionViewController ()

@end

@implementation GamesCollectionViewController

static NSString * const reuseIdentifier = @"GameCell";

- (NSArray *) games {
    
    if(!_games) {
        _games = [[GamesDetailsObject alloc] initializeWithGames];
    }
    return _games;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.games count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    GamesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    long index = indexPath.item + (indexPath.section * 2);
    NSDictionary *gameItem = [self.games objectAtIndex:index];
    UIImage *image = [UIImage imageNamed:[gameItem objectForKey:GAME_ICON]];
    NSString *title = [gameItem objectForKey:GAME_TITLE];
    [cell setImageForEachGame: image andTitleForEachGame:title];
    [UIDesignUtility roundTheCorners:cell];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.destinationViewController isKindOfClass:[SuperGameViewController class]]) {
        SuperGameViewController *superVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:sender];
        superVC.gameDetails = [self.games objectAtIndex:indexPath.item];
    }
}

@end
