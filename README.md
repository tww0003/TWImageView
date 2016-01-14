# TWImageView
An NSImageView subclass that allows an image to be dragged dropped into it.  
Useful for if you want to drop an image into a window, manipulate it, then display it.
  
TWImageView only supports the dropping of one image, but can easily be modified to handle more images by changing the delegate method.   
TWImageView was based off of [this] repo
# Usage

1. Clone the repo and drop the "TWImageView" folder into your project.  
2. In your storyboard or .xib file, drag an NSImageView onto your view and set the class to "TWImageView"  
3. Import "TWImageView.h" into your viewcontroller and make sure you let it know to use the TWImageViewDelegate
```
#import "TWImageView.h"

@interface ViewController : NSViewController <TWImageViewDelegate>

@property (nonatomic, weak) IBOutlet TWImageView *myImageView; 
``` 
4. Set the view controller as the TWImageView delegate  
`self.myImageView.delegate = self;`
5. Implement the delegate method
```
- (void) imageView:(TWImageView *)imageView didReceiveImage:(NSImage *)image {
    // if you want the image to appear in the TWImageView when dropped
    [self.myImageView setImage:image];
}
```
# License 
MIT

   [this]: <https://github.com/GenjiApp/DropFilesApp>

