//
//  GamesDetailsObject.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/9/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "GamesDetailsObject.h"

@implementation GamesDetailsObject

- (NSArray *)initializeWithGames {
    
    NSDictionary *catchPhrase = @{
                                  GAME_ICON: @"CatchPhrase.png",
                                  GAME_TITLE: @"Catch Phrase",
                                  };
    
    NSDictionary *password = @{
                               GAME_ICON: @"Password.png",
                               GAME_TITLE: @"Password"
                               };
    
    NSDictionary *pictionary = @{
                                 GAME_ICON: @"Pictionary.png",
                                 GAME_TITLE: @"Pictionary"
                                 };
    
    NSDictionary *charade = @{
                              GAME_ICON: @"Charade.png",
                              GAME_TITLE: @"Charade"
                              };
    
    NSArray *games = [NSArray arrayWithObjects:catchPhrase, password, pictionary, charade, nil];
                      
    return games;
    
}

@end
