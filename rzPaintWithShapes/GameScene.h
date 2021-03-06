//
//  GameScene.h
//  rzPaintWithShapes
//

//  Copyright (c) 2015 Robert Zimmelman. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Photos/Photos.h>
#import <GamePlayKit/GamePlayKit.h>

@interface GameScene : SKScene<UIGestureRecognizerDelegate>
-(void)myMakeShapeIndicator: (SKNode *) theNode : (NSString*) theAudioFileName;
@property SKShapeNode *mySquareShape;
//@property SKSpriteNode *myImageSprite;
@property int myShapeType;
@property NSNumber *myShapeNumber;
@property SKNode *mySpiralShapeNode;
@property SKNode *myAlphabetNode;
@property SKNode *myCakeNode;
@property SKNode *myBaloonNode;
@property SKNode *myOspreyNode;
@property SKNode *myEgretNode;
@property SKNode *myFlagNode;
@property SKNode *myFiretruckNode;
@property SKNode *myAirplaneNode;
@property SKNode *myAmbulanceNode;
@property SKNode *mySpirographNode;
@property SKNode *myIndicatorNode;

@property SKNode *myBulldozerNode;
@property SKNode *myCementMixerNode;
@property SKNode *mySubmarineNode;
@property SKNode *myTowtruckNode;
@property SKNode *myHelicopterNode;
@property SKNode *myPoliceCarNode;



@property SKEmitterNode *myFirefliesParticle;
@property SKEmitterNode *myFireyParticle;
@property SKEmitterNode *myRandomFireyParticle;

@property SKEmitterNode *myMagicParticle;
@property UIStackView *myShapeSelectionStackView;
@property UILabel *myInstructionsLabel;
@property GKRandomSource *myRandomSource;
@property GKGaussianDistribution *myGaussianSizeSource;

@property BOOL myViewControllerSaysWeAreRecording;


//@property UIBarButton *myRecord


@end
