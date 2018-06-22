//
//  GameViewController.h
//  rzSpriteKaleidoscope
//

//  Copyright (c) 2015 Robert Zimmelman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
//#import <ReplayKit/ReplayKit.h>

//@interface GameViewController : UIViewController<RPPreviewViewControllerDelegate, RPScreenRecorderDelegate>
@interface GameViewController : UIViewController
- (IBAction)myTakePictureButtonPressed:(UIButton *)sender;
//@property RPScreenRecorder *myReplayScreenRecorder;
//@property RPPreviewViewController *myReplayPreviewController;
//- (IBAction)myRecordButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *myRecordingIndicator;
//- (IBAction)myStopButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *myRecordButton;
@property (weak, nonatomic) IBOutlet UIButton *myStopButton;


//@property RPPreviewViewController *myPreviewViewController;

- (IBAction)mySpirographPressed:(UIButton *)sender;
- (IBAction)mySpiralPressed:(UIButton *)sender;
- (IBAction)myAlphabetPressed:(UIButton *)sender;
- (IBAction)myCakePressed:(UIButton *)sender;
- (IBAction)myBalloonPressed:(UIButton *)sender;
- (IBAction)myOspreyPressed:(UIButton *)sender;
- (IBAction)myFireyPressed:(UIButton *)sender;
- (IBAction)myFirefliesPressed:(UIButton *)sender;
- (IBAction)myRandomFireyPressed:(UIButton *)sender;
- (IBAction)myQuitButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *myQuitButton;

@end
