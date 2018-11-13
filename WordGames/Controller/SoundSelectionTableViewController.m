//
//  SoundSelectionTableViewController.m
//  WordGames
//
//  Created by Vasudeva Manepalli on 11/12/18.
//  Copyright © 2018 Vasudeva Manepalli. All rights reserved.
//

#import "SoundSelectionTableViewController.h"
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger, TOLSoundType) {
    TOLSoundTypeSlide,
    TOLSoundTypeBeeps,
    TOLSoundTypeTaps
};

NSString * const kTOLSoundCellIdentifier = @"sound-cell";

@interface SoundSelectionTableViewController ()

@property (nonatomic, strong) NSArray *soundPlayers;

@end

@implementation SoundSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readIndexes];
    
    NSMutableArray *slides = [NSMutableArray array];
    NSMutableArray *beeps = [NSMutableArray array];
    NSMutableArray *taps = [NSMutableArray array];
    
    NSMutableArray *slideSessions = [NSMutableArray array];
    NSMutableArray *beepSessions = [NSMutableArray array];
    NSMutableArray *tapSessions = [NSMutableArray array];
    
    NSMutableArray *allSounds = [[NSMutableArray alloc] init];
    [allSounds addObjectsFromArray:[[NSBundle mainBundle] pathsForResourcesOfType:@"aif" inDirectory:@"beeps"]];
    [allSounds addObjectsFromArray:[[NSBundle mainBundle] pathsForResourcesOfType:@"aif" inDirectory:@"slides"]];
    [allSounds addObjectsFromArray:[[NSBundle mainBundle] pathsForResourcesOfType:@"aif" inDirectory:@"taps"]];
    for (NSString *soundReference in allSounds) {
        NSURL *soundURL = [NSURL fileURLWithPath:soundReference];
        NSError *error = nil;
        AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
        [audioPlayer prepareToPlay];
        
        if ([soundReference rangeOfString:@"beep"].length > 0) {
            [beeps addObject:soundReference];
            [beepSessions addObject:audioPlayer];
        } else if ([soundReference rangeOfString:@"slide"].length > 0) {
            [slides addObject:soundReference];
            [slideSessions addObject:audioPlayer];
        } else {
            [taps addObject:soundReference];
            [tapSessions addObject:audioPlayer];
        }
    }
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    self.tableViewData = @[slides, beeps, taps];
    self.soundPlayers = @[slideSessions, beepSessions, tapSessions];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kTOLSoundCellIdentifier];
}

- (void) readIndexes {
    
    self.indexRow = [[[NSUserDefaults standardUserDefaults] objectForKey:self.soundRowKey] intValue];
    self.indexSection = [[[NSUserDefaults standardUserDefaults] objectForKey:self.soundSectionKey] intValue];
    
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTOLSoundCellIdentifier forIndexPath:indexPath];
    if(self.indexSection == (int) indexPath.section && self.indexRow == (int) indexPath.row) {
        cell.backgroundColor = [UIColor grayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Play sound
    AVAudioPlayer *player = self.soundPlayers[indexPath.section][indexPath.row];
    [player play];
    self.indexRow = (int) indexPath.row;
    self.indexSection = (int) indexPath.section;
    [tableView reloadData];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.tableViewData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableViewData[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch ((TOLSoundType)section) {
        case TOLSoundTypeSlide:
            return @"Slides";
            break;
        case TOLSoundTypeBeeps:
            return @"Beeps";
            break;
        case TOLSoundTypeTaps:
            return @"Taps";
            break;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [self soundNameFromPath:self.tableViewData[indexPath.section][indexPath.row]];
}


#pragma mark - Helpers

- (NSString *)soundNameFromPath:(NSString *)path
{
    NSString *fileName = [[path lastPathComponent] stringByDeletingPathExtension];
    NSString *soundName = [[fileName componentsSeparatedByString:@"-"] lastObject];
    
    return [soundName capitalizedString];
}

#pragma mark - IBActions
- (IBAction)btnIsSaveIsPressed:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.indexRow] forKey:self.soundRowKey];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.indexSection] forKey:self.soundSectionKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.delegate useSoundFile:self.tableViewData[self.indexSection][self.indexRow]];
    [self dismissViewControllerAnimated:true completion:nil];
    
}
@end
