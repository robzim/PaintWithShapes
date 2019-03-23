//
//  GameScene.m
//  rzSpriteKaleidoscope
//
//  Created by Robert Zimmelman on 12/11/15.
//  Copyright (c) 2015 Robert Zimmelman. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
@synthesize mySquareShape;
@synthesize myShapeType;
@synthesize mySpiralShapeNode, myAlphabetNode, myCakeNode, myBaloonNode, myOspreyNode, myEgretNode, myFlagNode;
@synthesize myAirplaneNode, myAmbulanceNode, myFiretruckNode, mySpirographNode;
@synthesize myFireyParticle, myRandomFireyParticle, myFirefliesParticle, myMagicParticle;
@synthesize myShapeSelectionStackView;
@synthesize myShapeNumber;
@synthesize myInstructionsLabel;
@synthesize myRandomSource;
@synthesize myGaussianSizeSource;
@synthesize myViewControllerSaysWeAreRecording;


-(void)willMoveFromView:(SKView *)view{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:@"takepicture"
                                                  object:nil];
}

-(void)myShowInstructionsLabel{
    [myInstructionsLabel setHidden:NO];
}



-(void)myLongPressAction{
    //
    //
    // raise the menu
    [myShapeSelectionStackView setHidden:NO];
    [myInstructionsLabel setHidden:YES];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(myShowInstructionsLabel) userInfo:nil repeats:NO];
}

-(void)didMoveToView:(SKView *)view {
    UITapGestureRecognizer *myTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myLongPressAction)];
    [myTapGestureRecognizer setNumberOfTapsRequired:1];
    [myTapGestureRecognizer setDelaysTouchesBegan:YES];
    [myTapGestureRecognizer setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:myTapGestureRecognizer];
    [self setBackgroundColor:[UIColor blackColor]];
    //    CGPoint myLocation = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myTakePicture)
                                                 name:@"takepicture"
                                               object:nil];
    NSString *myFirefliesParticlePath = [[NSBundle mainBundle] pathForResource:@"myFirefliesParticle" ofType:@"sks"];
    myFirefliesParticle =  [NSKeyedUnarchiver unarchiveObjectWithFile:myFirefliesParticlePath];
    NSString *myFireyParticlePath = [[NSBundle mainBundle] pathForResource:@"myFireyParticle" ofType:@"sks"];
    myFireyParticle =  [NSKeyedUnarchiver unarchiveObjectWithFile:myFireyParticlePath];
    NSString *myRandomFireyParticlePath = [[NSBundle mainBundle] pathForResource:@"myMagicParticle" ofType:@"sks"];
    myRandomFireyParticle =  [NSKeyedUnarchiver unarchiveObjectWithFile:myRandomFireyParticlePath];
    mySpiralShapeNode = [self childNodeWithName:@"mySpiralShape"];
    myAlphabetNode = [self childNodeWithName:@"myAlphabet"];
    myCakeNode = [self childNodeWithName:@"myCake"];
    myBaloonNode = [self childNodeWithName:@"myBaloons"];
    myOspreyNode = [self childNodeWithName:@"myOsprey"];
    myEgretNode = [self childNodeWithName:@"myEgret"];
    myFlagNode = [self childNodeWithName:@"myFlag"];
    myFiretruckNode = [self childNodeWithName:@"myFiretruck"];
    myAirplaneNode = [self childNodeWithName:@"myAirplane"];
    myAmbulanceNode = [self childNodeWithName:@"myAmbulance"];
    mySpirographNode = [self childNodeWithName:@"mySpirograph"];
    myShapeSelectionStackView = [self.view viewWithTag:9999];
    myInstructionsLabel = [self.view viewWithTag:8888];
    [myShapeSelectionStackView setHidden:YES];
//    myShapeNumber = [[NSNumber alloc] initWithInt:1];
//    myShapeType = 0;
    myRandomSource = [[GKRandomSource alloc] init];
    myGaussianSizeSource = [[ GKGaussianDistribution alloc ] initWithRandomSource:myRandomSource lowestValue:0 highestValue:50];
}


-(void)myPhotoIsSaved{
    NSLog(@"Photos Are Saved!");
}



- (void)               image: (UIImage *) image
    didFinishSavingWithError: (NSError *) error
                 contextInfo: (void *) contextInfo;
{
    if (error) {
        NSLog(@"Error Info = %@",error);
    }
    
}


-(void)myTakePicture{
    NSLog(@"in take picture");
    // 201 is the take picture button
    [[self.view viewWithTag:201] setHidden:YES];
    // 101 is record button
    [[self.view viewWithTag:101] setHidden:YES];
        // 301 is quit button
    [[self.view viewWithTag:301] setHidden:YES];
    
    [myInstructionsLabel setHidden:YES];
    
    //
    
    //    UIGraphicsBeginPDFPageWithInfo(self.view.bounds, nil);
    
    
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view drawViewHierarchyInRect:self.frame afterScreenUpdates:YES];
    UIImage *myScreenshot = UIGraphicsGetImageFromCurrentImageContext();
    [myScreenshot drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(myScreenshot, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    
    
    
    SKTexture *myTexture = [SKTexture textureWithImage:myScreenshot];
    SKSpriteNode *myImageSprite = [SKSpriteNode spriteNodeWithTexture:myTexture];
    [myImageSprite setPosition:CGPointMake( self.frame.size.width /2.0, self.frame.size.height / 2.0  )];
    //    [myImageSprite setSize:CGSizeMake(self.frame.size.width/3.0, self.frame.size.height/3.0)];
    [myImageSprite setSize:CGSizeMake(self.view.bounds.size.width/1.5,self.view.bounds.size.height/1.5)];
    
    //    [myImageSprite setScale:0.5];
    
    [self removeAllChildren];
    
    [self addChild:myImageSprite];
    
    
    SKLabelNode *myTookPictureLabel = [SKLabelNode labelNodeWithText:@"Picture added to your Photos Library"];
                                       [myTookPictureLabel setPosition:CGPointMake(self.frame.size.width /2.0, 700)];
    [myTookPictureLabel setFontSize:20.0];
    
    [self addChild:myTookPictureLabel];
    SKAction *myTookPictureAction = [SKAction sequence:@[
                                                         [SKAction waitForDuration:2.0],
                                                         [SKAction scaleTo:0.1 duration:0.1],
                                                         [SKAction removeFromParent],
                                                         ]];
    [myTookPictureLabel runAction:myTookPictureAction];
    
    //    NSArray *myObjects = [NSArray arrayWithObject:myScreenshot];
    
    [myInstructionsLabel setHidden:NO];
    [myImageSprite runAction: [SKAction sequence: @[
                                                    [SKAction waitForDuration:3.0],
                                                    [SKAction scaleTo:1.2 duration:0.25],
                                                    [SKAction scaleTo:0.01 duration:0.1],
                                                    [SKAction removeFromParent],
                                                    [SKAction runBlock:^{
        // 201 is the take picture button
        [[self.view viewWithTag:201] setHidden:NO];
        // 101 is record button
        if (!self->myViewControllerSaysWeAreRecording) {
            [[self.view viewWithTag:101] setHidden:NO];
            // 301 is quit button
            [[self.view viewWithTag:301] setHidden:NO];

        }
        
    }],
                                                    ]]];
}


- (void)addNewAssetWithImage:(UIImage *)image toAlbum:(PHAssetCollection *)album {
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        // Request creating an asset from the image.
        PHAssetChangeRequest *createAssetRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        // Request editing the album.
        PHAssetCollectionChangeRequest *albumChangeRequest = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:album];
        // Get a placeholder for the new asset and add it to the album editing request.
        PHObjectPlaceholder *assetPlaceholder = [createAssetRequest placeholderForCreatedAsset];        [albumChangeRequest addAssets:@[ assetPlaceholder ]];
    } completionHandler:^(BOOL success, NSError *error) {
        NSLog(@"Finished adding asset. %@", (success ? @"Success" : error));
    }];
}




-(void)myMakeSpirograph: (CGPoint) atLocation{
    int myRX =  (int) [myGaussianSizeSource nextInt];
    int myRY =  (int) [myGaussianSizeSource nextInt];
    NSLog(@"myX = %d, myY = %d",myRX,myRY);
    CGPathRef mySquarePath = CGPathCreateWithRect(CGRectMake(0, 0, myRX, myRY), nil);
    mySquareShape = [SKShapeNode shapeNodeWithPath:mySquarePath];
    float myRandomR = arc4random()%1000;
    float myRandomG = arc4random()%1000;
    float myRandomB = arc4random()%1000;
    myRandomR = myRandomR / 1000;
    myRandomG = myRandomG / 1000;
    myRandomB = myRandomB / 1000;
    float myAngleIncrement = (arc4random()%10)+2.0;
    myAngleIncrement = myAngleIncrement / 10.0;
    NSLog(@"my Angle Increment = %f",myAngleIncrement);
    for (float angle = 0; angle < (M_PI*2); angle += myAngleIncrement) {
        SKShapeNode *myDroppedNode = [mySquareShape copy];
        [myDroppedNode setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromPath:mySquarePath]];
        [myDroppedNode setPosition:atLocation];
        [myDroppedNode.physicsBody setDynamic:YES];
        [myDroppedNode.physicsBody setAffectedByGravity:NO];
        [myDroppedNode.physicsBody setAllowsRotation:YES];
        [myDroppedNode setStrokeColor:[UIColor colorWithRed:myRandomR green:myRandomG blue:myRandomB alpha:1.0]];
        [myDroppedNode setZRotation:angle];
        [self addChild:myDroppedNode];
        SKAction *myWaitAndRemove = [SKAction sequence:@[
                                                         [SKAction waitForDuration:5.0],
                                                         [SKAction scaleTo:0.5 duration:0.3],
                                                         [SKAction waitForDuration:0.3],
                                                         [SKAction scaleTo:0.25 duration:0.3],
                                                         [SKAction waitForDuration:0.2],
                                                         [SKAction scaleTo:0.05 duration:0.3],
                                                         [SKAction waitForDuration:0.1],
                                                         [SKAction removeFromParent],
                                                         ]];
        SKAction *mySpirographAction = [SKAction group:@[
                                                         [SKAction rotateByAngle:M_PI duration:10.0],
                                                         myWaitAndRemove,
                                                         ]];
        [myDroppedNode runAction:mySpirographAction];
        
    }
    
}

-(void) myMakeShapeTrail: (CGPoint) location ofSize: (float) theSize{

//-(void)myMakeShapeTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [mySpiralShapeNode copy];
    [myTrailNode setPosition:location];
    [myTrailNode setScale:theSize];
    [self addChild:myTrailNode];
    
    SKAction *myWaitScaleRemove = [SKAction sequence:@[
                                                       [SKAction waitForDuration:1.0],
                                                       [SKAction scaleTo:0.5 duration:0.1],
                                                       [SKAction waitForDuration:9.0],
                                                       [SKAction scaleTo:0.01 duration:0.1],
                                                       [SKAction removeFromParent],
                                                       ]];
    SKAction *myShapeTrailAction = [SKAction group:@[
                                                     [SKAction rotateByAngle:M_PI duration:10.0],
                                                     myWaitScaleRemove,
                                                     ]];
    [myTrailNode runAction:myShapeTrailAction];
    
    //    [myTrailNode runAction:[SKAction sequence:@[
    //                                                ]]];
}

-(void)myMakeShapeIndicator: (SKNode *) theNode {
    SKNode *myIndicatorNode = [theNode copy];
    double myMidX = self.scene.size.width / 2.0;
    double myMidY = self.scene.size.height / 2.0;
    [myIndicatorNode setPosition:CGPointMake(myMidX, myMidY)];
    [self addChild:myIndicatorNode];
    [myIndicatorNode runAction:[SKAction sequence:@[
                                                    [SKAction waitForDuration:1.0],
                                                    [SKAction scaleTo:0.1 duration:1.0],
                                                    [SKAction waitForDuration:0.1],
                                                    [SKAction removeFromParent],
                                                    ]]];
}



-(void)myMakeNodeTrail: (SKNode *) theNode : (CGPoint) atLocation {
    SKNode *myTrailNode = [theNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                  [SKAction scaleTo:0.2 duration:0.5],
                                                                  [SKAction waitForDuration:9.9],
                                                                  [SKAction scaleTo:0.01 duration:0.1],
                                                                  [SKAction removeFromParent],
                                                                  ]],]]];
}



-(void)myMakeCakeTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [myCakeNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                  [SKAction scaleTo:0.5 duration:0.5],
                                                                  [SKAction waitForDuration:9.9],
                                                                  [SKAction scaleTo:0.01 duration:0.1],
                                                                  [SKAction removeFromParent],
                                                                  ]],]]];
}



-(void)myMakeAlphabetTrail: (CGPoint) atPosition{
    SKNode *myTrailNode = [myAlphabetNode copy];
    [myTrailNode setPosition:atPosition];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                                             [SKAction scaleTo:0.5 duration:0.5],
                                                                                             [SKAction waitForDuration:9.9],
                                                                                             [SKAction scaleTo:0.01 duration:0.1],
                                                                                             [SKAction removeFromParent],
                                                                  ]],]]];
}


-(void)myMakeBaloonsTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [myBaloonNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    
    SKAction *myScaleAndRemove = [SKAction sequence:@[
                                                      [SKAction scaleTo:0.5 duration:0.5],
                                                      [SKAction waitForDuration:9.0],
                                                      [SKAction scaleTo:0.1 duration:0.25],
                                                      [SKAction removeFromParent],
                                                      ]];
    SKAction *myBaloonsAction = [SKAction group:@[
                                                  [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                                  myScaleAndRemove,
                                                  ]];
    
    [myTrailNode runAction:myBaloonsAction];
}

-(void)myMakeEgretsTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [myEgretNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                  [SKAction scaleTo:0.5 duration:0.5],
                                                                  [SKAction waitForDuration:9.9],
                                                                  [SKAction scaleTo:0.01 duration:0.1],
                                                                  [SKAction removeFromParent],
                                                                  ]],]]];
    
}


-(void)myMakeFlagTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [myFlagNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                  [SKAction scaleTo:0.5 duration:0.5],
                                                                  [SKAction waitForDuration:9.9],
                                                                  [SKAction scaleTo:0.01 duration:0.1],
                                                                  [SKAction removeFromParent],
                                                                  ]],]]];
    
}



-(void)myMakeOspreysTrail: (CGPoint) atLocation {
    SKNode *myTrailNode = [myOspreyNode copy];
    [myTrailNode setPosition:atLocation];
    float myRandomScale = arc4random()%3;
    myRandomScale = myRandomScale / 10.0;
    [myTrailNode setScale:myRandomScale];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction group:@[
                                             [SKAction rotateByAngle:M_PI*-1.0 duration:11.0],
                                             [SKAction sequence:@[
                                                                  [SKAction waitForDuration:0.1],
                                                                  [SKAction scaleTo:0.5 duration:0.5],
                                                                  [SKAction waitForDuration:9.9],
                                                                  [SKAction scaleTo:0.01 duration:0.1],
                                                                  [SKAction removeFromParent],
                                                                  ]],]]];
    
}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesMoved:touches withEvent:event];
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        switch ([myShapeNumber integerValue]) {
            case 1:
                [self myMakeSpirograph: location];
                break;
            case 2:
            {
                float myRandomScale = arc4random()%3;
                myRandomScale = myRandomScale / 10.0;
                [self myMakeShapeTrail:location ofSize:myRandomScale];
                break;
            }
            case 3:
                // make an alphabet trail
                [self myMakeAlphabetTrail: location];
                break;
            case 4:
                // make an cake trail
                [self myMakeCakeTrail: location];
                break;
            case 5:
                // make an baloon trail
                [self myMakeBaloonsTrail: location];
                break;
            case 6:
                // make an osprey trail
                [self myMakeOspreysTrail: location];
                break;
            case 7:
                // make an fireflies trail
                [self myMakeFireyTrail: location];
                break;
            case 8:
                // make a fireflies trail
                [self myMakeRandomFireyTrail: location];
                break;
            case 9:
                // make a fireflies trail
                [self myMakeFirefliesTrail: location];
                break;
            case 10:
                // make a fireflies trail
                [self myMakeEgretsTrail: location];
                break;
            case 11:
                // make a Flag trail
                [self myMakeFlagTrail: location];
                break;
            case 12:
                // make a Firetruck trail
                [self myMakeNodeTrail:myFiretruckNode : location];
                break;
            case 13:
                // make an Ambulance trail
                [self myMakeNodeTrail:myAmbulanceNode : location];
                break;
            case 14:
                // make an Airplane trail
                [self myMakeNodeTrail:myAirplaneNode : location];
                break;
            default:
                break;
        }
    }
}

-(void)myMakeFireyTrail: (CGPoint) atLocation {
    //    SKEmitterNode *myTrailNode = [myMagicParticle copy];
    SKEmitterNode *myTrailNode = [myFireyParticle copy];
    // works 9/29
    [myTrailNode setParticleBirthRate:10.0];
    // the particle's color sequence that was set in the interface builder must be nulled to use your own colors 9/29
    
    
    //    [myTrailNode setParticleColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0]];
    [myTrailNode setPosition:atLocation];
    [self addChild:myTrailNode];
    
    [myTrailNode runAction:[SKAction sequence:@[
                                                //                                                [SKAction waitForDuration:3.0],
                                                //                                                [SKAction colorizeWithColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0] colorBlendFactor:1.0 duration:3.0],
                                                //                                                [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
                                                //        [(SKEmitterNode *) node setParticleColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0]];
                                                //    }],
                                                //                                                [SKAction waitForDuration:3.0],
                                                //                                                [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
                                                //        [(SKEmitterNode *) node setParticleColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0]];
                                                //    }],
                                                [SKAction waitForDuration:10.0],
                                                [SKAction removeFromParent],
                                                ]]];
    
    
}


-(void)myMakeRandomFireyTrail: (CGPoint) atLocation {
    
    float myRandomRed = arc4random()%100;
    myRandomRed = myRandomRed / 100;
    float myRandomGreen = arc4random()%100;
    myRandomGreen = myRandomGreen / 100;
    float myRandomBlue = arc4random()%100;
    myRandomBlue = myRandomBlue / 100;
    
    
//    SKEmitterNode *myTrailNode = [myMagicParticle copy];
    SKEmitterNode *myTrailNode = [myRandomFireyParticle copy];
    
    
    // works 9/29
    [myTrailNode setParticleBirthRate:10.0];
    
    
    
    
    // the particle's color sequence that was set in the interface builder must be nulled to use your own colors 9/29
    [myTrailNode setParticleColorSequence:NULL];
    [myTrailNode setParticleColorBlendFactor:1.0];
    
    
    [myTrailNode setParticleColorRedRange:0.5];
    [myTrailNode setParticleColorBlueRange:0.9];
    [myTrailNode setParticleColorGreenRange:0.5];
    
    [myTrailNode setParticleColorRedSpeed:1.0];
    [myTrailNode setParticleColorBlueSpeed:1.0];
    [myTrailNode setParticleColorGreenSpeed:1.0];
    
    
//    [myTrailNode setParticleColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0]];
    [myTrailNode setPosition:atLocation];
    [self addChild:myTrailNode];

    [myTrailNode runAction:[SKAction sequence:@[
//                                                [SKAction waitForDuration:3.0],
//                                                [SKAction colorizeWithColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0] colorBlendFactor:1.0 duration:3.0],
//                                                [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
//        [(SKEmitterNode *) node setParticleColor:[UIColor colorWithRed:1.0 green:1.0 blue:0.0 alpha:1.0]];
//    }],
//                                                [SKAction waitForDuration:3.0],
//                                                [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode * _Nonnull node, CGFloat elapsedTime) {
//        [(SKEmitterNode *) node setParticleColor:[UIColor colorWithRed:myRandomRed green:myRandomGreen blue:myRandomBlue alpha:1.0]];
//    }],
                                                [SKAction waitForDuration:10.0],
                                                [SKAction removeFromParent],
                                                ]]];
    
    
}

-(void)myMakeFirefliesTrail: (CGPoint) atLocation {
    SKEmitterNode *myTrailNode = [myFirefliesParticle copy];
    [myTrailNode setPosition:atLocation];
    [self addChild:myTrailNode];
    [myTrailNode runAction:[SKAction sequence:@[
                                                //                                                [SKAction waitForDuration:0.1],
                                                //                                                [SKAction scaleTo:2.0 duration:0.5],
                                                [SKAction waitForDuration:10.0],
                                                //                                                [SKAction scaleTo:0.1 duration:0.1],
                                                [SKAction removeFromParent],
                                                ]]];
    
    
}




@end
