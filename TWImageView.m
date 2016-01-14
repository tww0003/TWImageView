//
//  TWImageView.m
//
//  Created by Tyler Williamson on 1/14/16.

#import "TWImageView.h"

@implementation TWImageView {
    BOOL imageEntered;
}

- (id) init {
    self = [super init];
    
    if(self) {
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
    }
    return self;
}


- (void)drawRect:(NSRect)dirtyRect {
    
    if(imageEntered) {
        [[NSColor blueColor] set];
    } else {
        [[NSColor windowBackgroundColor] set];
    }
    
    NSRectFill(dirtyRect);
    
    [super drawRect:dirtyRect];
    
}

#pragma mark NSDraggingDestination Methods
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
    imageEntered = YES;
    [self setNeedsDisplay:YES];
    return NSDragOperationCopy;
}

- (void)draggingExited:(id<NSDraggingInfo>)sender
{
    imageEntered = NO;
    [self setNeedsDisplay:YES];
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender
{
    imageEntered = NO;
    [self setNeedsDisplay:YES];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
    NSPasteboard *pasteboard = [sender draggingPasteboard];
    if([[pasteboard types] containsObject:NSFilenamesPboardType]) {
        
        NSImage *imageDropped = [[NSImage alloc] initWithContentsOfFile:[pasteboard propertyListForType:NSFilenamesPboardType][0]];
        
        if([self.delegate respondsToSelector:@selector(imageView:didReceiveImage:)]) {
            [self.delegate imageView:self didReceiveImage:imageDropped];
        }
        return YES;
    }
    
    return NO;
}

- (void)concludeDragOperation:(id <NSDraggingInfo>)sender
{
    [self setNeedsDisplay:NO];
}

@end
