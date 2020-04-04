#import "Birds.h"
#import "LevelScene.h"

@implementation Birds

-(id) initWithImageNamed:(NSString *)name {
    if (self = [super initWithImageNamed:name])
    {
        self.xSpeed = 0;
        self.ySpeed = 0;
        self.enabled = false;
        self.visible = false;
        self.type = 0;
    }
    return self;
}

-(void)update:(NSTimeInterval)currentTime{
    
    self.position = CGPointMake(self.position.x + self.xSpeed, self.position.y + self.ySpeed);

    if (self.position.x < 0 || self.position.x > 375 || self.position.y < 180 || self.position.y > 567)
        {
        [self birdOnWire];
        }
    
    if (self.position.x < 0 || self.position.x > 375)
        {
        [self recycle];
        }
    
}


-(void)birdOnWire{

    // Stops the birds on the wire (y = 180), and replaces the flying of the birds with a sitting position
    self.ySpeed = 0;
    self.xSpeed = 0;
    
    if (self.position.y < 180 && self.ySpeed < 1)
        {
        switch (self.type)
            {
            case 0: // penguin
                [self setTexture:[CCTexture textureWithFile:@"Penguin1.png"]];
                self.scaleX = 0.3;
                self.scaleY = 0.6;
                break;
                    
            case 1: // owl
                [self setTexture:[CCTexture textureWithFile:@"NewOwlnoWings.png"]];
                self.scaleX = 0.3;
                self.scaleY = 0.8;
                break;
                
            case 2: // eagle
                [self setTexture:[CCTexture textureWithFile:@"NewEaglenoWings.png"]];
                self.scaleX = 0.4;
                self.scaleY = 0.9;
                break;
                    
            case 3: // other birb
                [self setTexture:[CCTexture textureWithFile:@"yellownoWings.png"]];
                self.scaleX = 0.1;
                self.scaleY = 0.4;
                break;
                    
            default:
                break;
            }
        }

    
}

-(void)recycle {
    
    self.enabled = false;
    self.visible = false;
    
}

@end
