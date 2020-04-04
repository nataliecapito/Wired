#import "BirdsController.h"

@implementation BirdsController

-(id)init{
    
    if (self = [super init])
        {
        self.timeToNextBird = 60;
        }
    return self;
    
}

-(void)update:(NSTimeInterval)currentTime{
    
    if (self.timeToNextBird)
        {
        self.timeToNextBird--;
        }
    
}

-(void)placeBirds:(Birds*)birds{
    
    // Creates random placement of the birds
    int chance = arc4random_uniform(100);
    if (chance < 25) // Left Screen
        {
        birds.position = CGPointMake(0, arc4random_uniform(567) + 180);
        birds.xSpeed = 0.195 * (chance % 80) + ((chance % 80 == 0)? 0.195: 0);
        birds.ySpeed = (birds.position.y < 228)? 0.1 * (chance % 40): -0.1 * (chance % 40);
        }
    else if (chance < 50)  // Right Screen
        {
        birds.position = CGPointMake(0, arc4random_uniform(567) + 180);
        birds.xSpeed = -0.195 * (chance % 80)  + ((chance % 80 == 0)? -0.195: 0);
        birds.ySpeed = (birds.position.y < 228)? 0.1 * (chance % 40): -0.1 * (chance % 40);
        }
    else if (chance < 0)  // Bottom Screen
        {
        birds.position = CGPointMake(arc4random_uniform(375), 180);
        birds.xSpeed = (birds.position.x < 158)? 0.1 * (chance % 40): -0.1 * (chance % 40);
        birds.ySpeed = 0.190 * (chance % 80)  + ((chance % 80 == 0)? 0.195: 0);
        }
    else if (chance < 100) // Top Screen
        {
        birds.position = CGPointMake(arc4random_uniform(375), 567);
        birds.xSpeed = (birds.position.x < 158)? 0.1 * (chance % 40): -0.1 * (chance % 40);
        birds.ySpeed = -0.190 * (chance % 80)  + ((chance % 80 == 0)? -0.195: 0);
        }
    //
    
    // Changes the bird type and the chances of that bird appearing
    // Overrides the default setting in LevelScene.m
    chance = arc4random_uniform(100);
    if(chance < 5) //make bird penguin
        {
        [birds setTexture:[CCTexture textureWithFile:@"Penguin1.png"]];
        birds.scaleX = 0.3;
        birds.scaleY = 0.6;
        birds.type = 0;
        }
    else if(chance < 25) //make bird owl
        {
        [birds setTexture:[CCTexture textureWithFile:@"NewOwlWings1.png"]];
        birds.scaleX = 0.8;
        birds.scaleY = 0.8;
        birds.type = 1;
        }
    else if (chance < 50) //make bird eagle
        {
        [birds setTexture:[CCTexture textureWithFile:@"NewEagleWings1.png"]];
        birds.scaleX = 0.9;
        birds.scaleY = 0.9;
        birds.type = 2;
        }
    else if (chance < 100) //make birbs other
        {
        [birds setTexture:[CCTexture textureWithFile:@"YellowWings1.png"]];
        birds.scaleX = 0.2;
        birds.scaleY = 0.4;
        birds.type = 3;
        }
    //
    
    birds.enabled = true;
    birds.visible = true;
    
}

-(void)randomizeTimeToNextBird{
    
    self.timeToNextBird = 60;
    
}

@end
