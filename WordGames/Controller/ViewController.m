//
//  ViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

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

@end
