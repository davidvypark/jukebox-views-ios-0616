//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by David Park on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"

@implementation FISJukeboxViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    self.playlist = [[FISPlaylist alloc] init];
    self.textView.text = self.playlist.text;
}

- (IBAction)playButton:(id)sender {
    NSString *userChoice = self.userInputTextField.text;
    
    FISSong *songToPlay = [self.playlist songForTrackNumber:[userChoice intValue]];
    
    [self setUpAVAudioPlayerWithFileName:songToPlay.fileName];
    [self.audioPlayer play];

}

- (IBAction)stopButton:(id)sender {
    
    [self.audioPlayer stop];
}


- (IBAction)titleButton:(id)sender {
    [self.playlist sortSongsByTitle];
    self.textView.text = self.playlist.text;
}

- (IBAction)artistButton:(id)sender {
    [self.playlist sortSongsByArtist];
    self.textView.text = self.playlist.text;
}

- (IBAction)albumButton:(id)sender {
    [self.playlist sortSongsByAlbum];
    self.textView.text = self.playlist.text;
}

- (void)setUpAVAudioPlayerWithFileName:(NSString *)fileName
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!self.audioPlayer)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

@end
