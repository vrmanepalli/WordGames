//
//  SoundSelectionTableViewController.h
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/12/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SoundSelectionProtocol <NSObject>

- (void) useSoundFile: (NSString *) filePath;

@end

@interface SoundSelectionTableViewController : UITableViewController

@property (nonatomic, weak) id <SoundSelectionProtocol> delegate;

@property (nonatomic) int indexSection;
@property (nonatomic) int indexRow;

@property (nonatomic, weak) NSString *soundRowKey;
@property (nonatomic, weak) NSString *soundSectionKey;

@property (nonatomic, strong) NSArray *tableViewData;

- (IBAction)btnIsSaveIsPressed:(id)sender;


@end

NS_ASSUME_NONNULL_END
