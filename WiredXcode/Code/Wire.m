#import "Wire.h"

@implementation Wire

-(id) initWithImageNamed:(NSString *)name {
    
    if (self = [super initWithImageNamed:name])
        {
        self.enabled = true;
        self.visible = true;
        self.type = 0;
        }
    return self;
    
}

@end
