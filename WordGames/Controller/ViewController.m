//
//  ViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "ViewController.h"
#import "SuperGameViewController.h"
#import "GamesCollectionViewCell.h"

@interface ViewController ()

@end

int selectedIndex;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
} 

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.gamesCollectionView cellForItemAtIndexPath:indexPath];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.gamesCollectionView numberOfSections];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.gamesCollectionView numberOfItemsInSection:section];
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.gamesCollectionView selectItemAtIndexPath:indexPath animated:true scrollPosition:UICollectionViewScrollPositionTop];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([sender isKindOfClass:[GamesCollectionViewCell class]]) {
        SuperGameViewController *superGMC = [[segue.destinationViewController childViewControllers] objectAtIndex:0];
        superGMC.gameDetails = [self.gamesCollectionView getSelectedGameObject];
    }
    
}

@end
