//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by David Park on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

@property (strong, nonatomic)NSMutableArray *songs;
@property (strong, nonatomic)NSMutableString *text;

-(void)sortSongsByTitle;

-(void)sortSongsByArtist;

-(void)sortSongsByAlbum;

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber;

@end
