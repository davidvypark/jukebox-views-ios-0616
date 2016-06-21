//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by David Park on 6/21/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        _songs = [self generateSongObjects];
    }
    self.text = [[self description] mutableCopy];
    
    return self;
    
}

-(void)sortSongsByTitle {
    
    NSSortDescriptor *sortByTitleAsc = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    self.songs = [[self.songs sortedArrayUsingDescriptors:@[sortByTitleAsc]] mutableCopy];
    self.text = [[self description] mutableCopy];
}

-(void)sortSongsByArtist {
    
    NSSortDescriptor *sortByArtistAsc = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    self.songs = [[self.songs sortedArrayUsingDescriptors:@[sortByArtistAsc]] mutableCopy];
    self.text = [[self description] mutableCopy];
}

-(void)sortSongsByAlbum {
    
    NSSortDescriptor *sortByAlbumAsc = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    self.songs =[[self.songs sortedArrayUsingDescriptors:@[sortByAlbumAsc]] mutableCopy];
    self.text = [[self description] mutableCopy];
    
}

-(FISSong *)songForTrackNumber:(NSUInteger)trackNumber {
    
    if (trackNumber < [self.songs count] && trackNumber > 0) {
        return self.songs[trackNumber - 1];
    }
    
    return nil;
}

- (NSMutableArray *)generateSongObjects
{
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Hold on Be Strong"
                                             artist:@"Matoma vs Big Poppa"
                                              album:@"The Internet 1"
                                           fileName:@"hold_on_be_strong"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Higher Love"
                                             artist:@"Matoma ft. James Vincent McMorrow"
                                              album:@"The Internet 2"
                                           fileName:@"higher_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Mo Money Mo Problems"
                                             artist:@"Matoma ft. The Notorious B.I.G."
                                              album:@"The Internet 3"
                                           fileName:@"mo_money_mo_problems"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Old Thing Back"
                                             artist:@"The Notorious B.I.G."
                                              album:@"The Internet 4"
                                           fileName:@"old_thing_back"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Gangsta Bleeding Love"
                                             artist:@"Matoma"
                                              album:@"The Internet 5"
                                           fileName:@"gangsta_bleeding_love"] ];
    
    [songs addObject:[[FISSong alloc] initWithTitle:@"Bailando"
                                             artist:@"Enrique Iglesias ft. Sean Paul"
                                              album:@"The Internet 6"
                                           fileName:@"bailando"] ];
    
    return songs;
}

-(NSString *)description {
    //This test is BOOLSHEET!!!!!! expect /n at the end
    
    self.text = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < [self.songs count]; i++) {
        
        FISSong *currentSong = self.songs[i];
        [self.text appendFormat:@"%lu. (Title) %@ (Artist) %@ (Album) %@\n", i + 1, currentSong.title, currentSong.artist, currentSong.album];
    }
    return self.text;
}


@end
