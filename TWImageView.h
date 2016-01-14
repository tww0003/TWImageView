//
//  TWImageView.h
//
//  Created by Tyler Williamson on 1/14/16.

#import <Cocoa/Cocoa.h>

@protocol TWImageViewDelegate;

@interface TWImageView : NSImageView <NSDraggingDestination>

@property (nonatomic, weak) id <TWImageViewDelegate> delegate;

@end

@protocol TWImageViewDelegate <NSObject>

- (void) imageView:(TWImageView *) imageView didReceiveImage:(NSImage *) image;

@end
