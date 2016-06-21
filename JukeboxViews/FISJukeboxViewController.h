//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by David Park on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "FISPlaylist.h"

@interface FISJukeboxViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userInputTextField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic)FISPlaylist *playlist;
@property (strong, nonatomic)AVAudioPlayer *audioPlayer;

@end
