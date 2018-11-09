//
//  UIDesignUtility.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/8/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "UIDesignUtility.h"


@implementation UIDesignUtility

+ (void) roundTheCorners:(UIView *) view {
    
    view.layer.cornerRadius = 15;
    view.layer.borderWidth = 2;
    view.layer.masksToBounds = true;
    view.layer.borderColor = [[UIColor grayColor] CGColor];
    
}

@end
