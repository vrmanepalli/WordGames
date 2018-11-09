//
//  SuperGameViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/9/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "SuperGameViewController.h"

@interface SuperGameViewController ()

@end

@implementation SuperGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnStopGameIsPressed:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
