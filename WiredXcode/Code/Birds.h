#import "Wire.h"

@interface Birds : CCSprite

@property (nonatomic, assign) CGFloat xSpeed, ySpeed;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, assign) int type;

-(void)update:(NSTimeInterval)currentTime;
-(void)birdOnWire;
-(void)recycle;

@end
