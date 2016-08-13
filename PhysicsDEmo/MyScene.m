//
//  MyScene.m
//  PhysicsDEmo
//
//  Created by Michael Henry on 4/24/14.
//  Copyright (c) 2014 Digital Javelina, LLC. All rights reserved.
//

#import "MyScene.h"

typedef NS_OPTIONS(NSUInteger, Category) {
    CategoryWall = 1 << 0,
    CategoryShip = 1 << 1,
    CategoryBall = 1 << 3
    
};
    

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *ship = [[SKSpriteNode alloc] initWithImageNamed:@"Spaceship.png"];
        ship.name = @"ship";
        ship.size = CGSizeMake(50, 50);
        ship.position = CGPointMake(CGRectGetMidX(self.frame),
                                    CGRectGetMidY(self.frame));
        
        ship.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
        
        [self addChild:ship];
        
        self.physicsWorld.gravity = CGVectorMake(0, -9.8);
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self addShip];
    
    if (arc4random_uniform(100) < 25) {
        SKShapeNode *ball = [SKShapeNode node];
        ball.strokeColor = [SKColor redColor];
        ball.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 50, 50)].CGPath;
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
        ball.physicsBody.categoryBitMask = CategoryBall;
        ball.physicsBody.collisionBitMask = CategoryShip;
        ball.position = CGPointMake(arc4random_uniform(CGRectGetMaxX(self.frame)),
                                    arc4random_uniform(CGRectGetMaxY(self.frame)));
        [self addChild:ball];
    }
}


- (void) addShip
{
    SKSpriteNode *ship = [[SKSpriteNode alloc] initWithImageNamed:@"Spaceship.png"];
    ship.name = @"ship";
    ship.size = CGSizeMake(50, 50);
    ship.position = CGPointMake(CGRectGetMidX(self.frame),
                                CGRectGetMidY(self.frame));
    
    ship.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:25];
    
    ship.physicsBody.restitution = 0.8;
    ship.physicsBody.categoryBitMask = CategoryShip;
    ship.physicsBody.collisionBitMask = CategoryWall | CategoryBall;
    [self addChild:ship];
}


@end
