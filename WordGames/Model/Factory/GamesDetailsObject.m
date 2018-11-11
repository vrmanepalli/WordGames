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
                                  SCORE_TEAM_1_KEY: @"Catch_Phrase_Team1_Score",
                                  SCORE_TEAM_2_KEY: @"Catch_Phrase_Team2_Score"
                                  };
    
    NSDictionary *password = @{
                               GAME_ICON: @"Password.png",
                               GAME_TITLE: @"Password",
                               SCORE_TEAM_1_KEY: @"Password_Team1_Score",
                               SCORE_TEAM_2_KEY: @"Password_Team2_Score"
                               };
    
    NSDictionary *pictionary = @{
                                 GAME_ICON: @"Pictionary.png",
                                 GAME_TITLE: @"Pictionary",
                                 SCORE_TEAM_1_KEY: @"Pictionary_Team1_Score",
                                 SCORE_TEAM_2_KEY: @"Pictionary_Team2_Score"
                                 };
    
    NSDictionary *charade = @{
                              GAME_ICON: @"Charade.png",
                              GAME_TITLE: @"Charade",
                              SCORE_TEAM_1_KEY: @"Charade_Team1_Score",
                              SCORE_TEAM_2_KEY: @"Charade_Team2_Score"
                              };
    
    NSArray *games = [NSArray arrayWithObjects:catchPhrase, password, pictionary, charade, nil];
                      
    return games;
    
}

@end
