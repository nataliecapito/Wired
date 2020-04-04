#import <UIKit/UIKit.h>
#import "Birds.h"
#import "Wire.h"

@interface BirdsController : CCNode

@property (nonatomic, assign) int timeToNextBird;

-(void)update:(NSTimeInterval)currentTime;
-(void)placeBirds:(Birds*)birds;
-(void)randomizeTimeToNextBird;

@end
