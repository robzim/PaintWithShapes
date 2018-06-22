//
//  GameViewController.m
//  rzSpriteKaleidoscope
//
//  Created by Robert Zimmelman on 12/11/15.
//  Copyright (c) 2015 Robert Zimmelman. All rights reserved.
//
//
//    APP NAME IS 'Paint With Shapes'
//
//


#import "GameViewController.h"
#import "GameScene.h"

@implementation GameViewController


//@synthesize myReplayPreviewController;
//@synthesize myReplayScreenRecorder;
@synthesize myRecordButton;
@synthesize myStopButton;
@synthesize myRecordingIndicator;
//@synthesize myPreviewViewController;
GameScene *myScene2;
SKView *myView2;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // hide the recording indicator and the stop button, we're not recording yet
    
//    [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//    [myStopButton setHidden:!myReplayScreenRecorder.isRecording];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    
    // Create and configure the scene.
    GameScene *scene = [GameScene nodeWithFileNamed:@"GameScene"];
    [scene setSize:self.view.frame.size];
    
    scene.scaleMode = SKSceneScaleModeAspectFit;

    // Present the scene.
    [skView presentScene:scene];
    myView2 = scene.view;
    myScene2 = scene;
}


-(IBAction)mySpirographPressed:(UIButton *)sender{
    myScene2.myShapeType = 1;
    myScene2.myShapeNumber = [NSNumber numberWithInt:1];
    [[self.view viewWithTag:9999] setHidden:YES];
};
- (IBAction)mySpiralPressed:(UIButton *)sender{
    myScene2.myShapeType = 2;
    myScene2.myShapeNumber = [NSNumber numberWithInt:2];
    [[self.view viewWithTag:9999] setHidden:YES];
};

- (IBAction)myAlphabetPressed:(UIButton *)sender{
    myScene2.myShapeType = 3;
    myScene2.myShapeNumber = [NSNumber numberWithInt:3];

    [[self.view viewWithTag:9999] setHidden:YES];
};


- (IBAction)myCakePressed:(UIButton *)sender{
    myScene2.myShapeType = 4;
    myScene2.myShapeNumber = [NSNumber numberWithInt:4];
    [[self.view viewWithTag:9999] setHidden:YES];
    };


- (IBAction)myBalloonPressed:(UIButton *)sender{
    myScene2.myShapeType = 5;
    myScene2.myShapeNumber = [NSNumber numberWithInt:5];
    [[self.view viewWithTag:9999] setHidden:YES];

};

- (IBAction)myOspreyPressed:(UIButton *)sender{
    myScene2.myShapeType = 6;
    myScene2.myShapeNumber = [NSNumber numberWithInt:6];
    [[self.view viewWithTag:9999] setHidden:YES];
    
};
- (IBAction)myFireyPressed:(UIButton *)sender{
    myScene2.myShapeType = 7;
    myScene2.myShapeNumber = [NSNumber numberWithInt:7];
    [[self.view viewWithTag:9999] setHidden:YES];
    
};
- (IBAction)myRandomFireyPressed:(UIButton *)sender {
    myScene2.myShapeType = 8;
    myScene2.myShapeNumber = [NSNumber numberWithInt:8];
    [[self.view viewWithTag:9999] setHidden:YES];
}

- (IBAction)myQuitButtonPressed:(UIButton *)sender {
    exit(0);
}

- (IBAction)myFirefliesPressed:(UIButton *)sender{
    myScene2.myShapeType = 9;
    myScene2.myShapeNumber = [NSNumber numberWithInt:9];
    [[self.view viewWithTag:9999] setHidden:YES];
    
};







- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (IBAction)myTakePictureButtonPressed:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"takepicture" object:self];
}



//
//
//
//
//
//
//    SCREEN RECORDING STUFF BELOW HERE
//
//
//
//
//
//



@end


//- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController {
//    NSLog(@"Preview Controller Finished");
//    //
//    ///
//    //  ask to share to social media sites
//    //
//    
//    myReplayScreenRecorder = [RPScreenRecorder sharedRecorder];
//    
//    [previewController dismissViewControllerAnimated:YES completion:^{
//        NSLog(@"dismiss view controller completion block");
//        [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        
//        UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:nil message:@"Completed Recording!!" preferredStyle:UIAlertControllerStyleAlert];
//        [self addChildViewController:myAlertController ];
//        
//        
//        
//        // hide the record indicator when the recorder isn't recording
//        [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        // hide the record button when the recorder is recording
//        [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        
//    }];
//}
//
//
//
//
//
//
//-(void)previewController:(RPPreviewViewController *)previewController didFinishWithActivityTypes:(NSSet<NSString *> *)activityTypes{
//    NSLog(@"recording is done. IN PREVIEW VIEW CONTROLLER");
//    [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//    [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//    [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//    
//    [myScene2 setPaused:NO];
//}
//
//
//
//-(void)screenRecorder:(RPScreenRecorder *)screenRecorder didStopRecordingWithError:(NSError *)error previewViewController:(RPPreviewViewController *)previewViewController{
//    if (!error) {
//        NSLog(@"about to show preview view controller");
//        //        [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        //        [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        //        [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        [myRecordingIndicator setHidden:YES];
//        [myRecordButton setHidden:NO];
//        [myStopButton setHidden:YES];
//        [self presentViewController:previewViewController animated:YES completion:^{
//            //
//            //  try to get over having to press stop twice
//            //
//            UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:nil message:@"Completed The Preview!!" preferredStyle:UIAlertControllerStyleAlert];
//            [self addChildViewController:myAlertController ];
//            //            [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//            //            [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//            //            [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//            //
//            //            [self myStopPressed:_myStopButton];
//        }];
//        
//    } else {
//        NSLog(@"error stopping recording");
//    }
//    
//}
//
//
//-(void)screenRecorderDidChangeAvailability:(RPScreenRecorder *)screenRecorder{
//    NSLog(@"screen recorder availability changed");
//}
//
//
//- (IBAction)myStopRecording:(UIButton *)sender {
//    myReplayScreenRecorder = [RPScreenRecorder sharedRecorder];
//    NSLog(@"Stop Pressed");
//    [myReplayScreenRecorder stopRecordingWithHandler:^(RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
//        [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        [previewViewController setPreviewControllerDelegate:self];
//        [previewViewController setEditing:YES animated:YES];
//        [self presentViewController:previewViewController animated:YES completion:^{
//            NSLog(@"recording is done");
//        }];
//        
//        //        if (!error) {
//        //            [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        //            [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        //            [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        //            [previewViewController setPreviewControllerDelegate:self];
//        //            [previewViewController setEditing:YES animated:YES];
//        //            [self presentViewController:previewViewController animated:YES completion:^{
//        //                NSLog(@"recording is done");
//        //            }];
//        //        } else if (error) {
//        //            NSLog(@"error = %@",error.localizedDescription);
//        //            [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        //            [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        //            [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        //
//        //        }
//        //        NSLog(@"Error = %@",error);
//        
//    }];
//    
//    if (!myReplayScreenRecorder.isRecording) {
//        [myScene2 setMyViewControllerSaysWeAreRecording:NO];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"recordingstopped" object:self];
//        [myRecordingIndicator setHidden:YES];
//        [myRecordButton setHidden:NO];
//        [myStopButton setHidden:YES];
//    }
//}
//
//- (IBAction)myStartRecording:(UIButton *)sender {
//    
//    myReplayScreenRecorder = [RPScreenRecorder sharedRecorder];
//    [myReplayScreenRecorder setDelegate:self];
//    //        [myReplayScreenRecorder setCameraEnabled:YES];
//    //        [myReplayScreenRecorder setMicrophoneEnabled:YES];
//    if (myReplayScreenRecorder.isAvailable) {
//        
//        
//        [myReplayScreenRecorder startRecordingWithMicrophoneEnabled:YES handler:^(NSError * _Nullable error) {
//            if (error) {
//                NSLog(@"ERROR.  Start REcording FAILED  Error %@",error.description);
//                return;
//            }
//        }];
//        // if we get here we are recording
//        NSLog(@"recording");
//        [myRecordButton setHidden:YES];
//        [myRecordingIndicator setHidden:NO];
//        [myStopButton setHidden:NO];
//        [myScene2 setMyViewControllerSaysWeAreRecording:YES];
//        
//        
//        //
//        //
//        //
//        // rz   LOOK AT CAMERA PREVIEW BELOW
//        //
//        
//        
//        [myReplayScreenRecorder.cameraPreviewView setFrame:CGRectMake(10, 10, 100, 100)];
//        [self.view addSubview:myReplayScreenRecorder.cameraPreviewView];
//        
//        //
//        //
//        // rz force the button states if the screenrecord is recording
//        if (myReplayScreenRecorder.isRecording) {
//            [myRecordingIndicator setHidden:NO];
//            [myRecordButton setHidden:YES];
//            [myStopButton setHidden:NO];
//        }
//        
//        
//    }
//}
//
//
//
//
//- (IBAction)myRecordButtonPressed:(UIButton *)sender {
//    
//    [self myStartRecording:sender];
//}
//
//- (IBAction)myStopButtonPressed:(UIButton *)sender {
//    [myReplayScreenRecorder stopRecordingWithHandler:^(RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
//        [myRecordingIndicator setHidden:!myReplayScreenRecorder.isRecording];
//        [myRecordButton setHidden:myReplayScreenRecorder.isRecording];
//        [myStopButton setHidden:!myReplayScreenRecorder.isRecording];
//        [previewViewController setPreviewControllerDelegate:self];
//        [previewViewController setEditing:YES animated:YES];
//        [self presentViewController:previewViewController animated:YES completion:^{
//            NSLog(@"recording is done");
//        }];
//        
//    }];
//    if (myReplayScreenRecorder.isRecording) {
//        [myRecordingIndicator setHidden:NO];
//        [myRecordButton setHidden:YES];
//        [myStopButton setHidden:NO];
//        [myScene2 setMyViewControllerSaysWeAreRecording:YES];
//    } else if (!myReplayScreenRecorder.isRecording) {
//        [myRecordingIndicator setHidden:YES];
//        [myRecordButton setHidden:NO];
//        [myStopButton setHidden:YES];
//        [myScene2 setMyViewControllerSaysWeAreRecording:NO];
//    }
//    
//}
