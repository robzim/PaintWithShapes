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
@synthesize myImageSelector;
//@synthesize myPreviewViewController;
GameScene *myScene2;
SKView *myView2;

@synthesize myCrdLabels;

- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue
{
    NSLog(@"unwound to here");
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myCrdLabels.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Path is %ld",(long)indexPath.row);
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myCrdLabels = @[@"one", @"two",  @"three", @"four"];
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

-(IBAction)myEgretPressed:(UIButton *)sender{
    myScene2.myShapeType = 1;
    myScene2.myShapeNumber = [NSNumber numberWithInt:10];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myEgretNode: @"Egret.mp3"];
};


-(IBAction)mySpirographPressed:(UIButton *)sender{
    myScene2.myShapeType = 1;
    myScene2.myShapeNumber = [NSNumber numberWithInt:1];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.mySpirographNode: @"Spirograph.mp3"];
};
- (IBAction)mySpiralPressed:(UIButton *)sender{
    myScene2.myShapeType = 2;
    myScene2.myShapeNumber = [NSNumber numberWithInt:2];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.mySpiralShapeNode: @"Spiral.mp3"];
};

- (IBAction)myAlphabetPressed:(UIButton *)sender{
    myScene2.myShapeType = 3;
    myScene2.myShapeNumber = [NSNumber numberWithInt:3];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myAlphabetNode: @"Alphabet.mp3"];
};


- (IBAction)myCakePressed:(UIButton *)sender{
    myScene2.myShapeType = 4;
    myScene2.myShapeNumber = [NSNumber numberWithInt:4];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myCakeNode: @"Cake.mp3"];
    };


- (IBAction)myBalloonPressed:(UIButton *)sender{
    myScene2.myShapeType = 5;
    myScene2.myShapeNumber = [NSNumber numberWithInt:5];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myBaloonNode: @"Balloons.mp3"];
};

- (IBAction)myOspreyPressed:(UIButton *)sender{
    myScene2.myShapeType = 6;
    myScene2.myShapeNumber = [NSNumber numberWithInt:6];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myOspreyNode: @"Osprey.mp3"];
};
- (IBAction)myFireyPressed:(UIButton *)sender{
    myScene2.myShapeType = 7;
    myScene2.myShapeNumber = [NSNumber numberWithInt:7];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myFireyParticle: @"Sparkles.mp3"];
};
- (IBAction)myRandomFireyPressed:(UIButton *)sender {
    myScene2.myShapeType = 8;
    myScene2.myShapeNumber = [NSNumber numberWithInt:8];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myRandomFireyParticle: @"Sparkles.mp3"];
}

- (IBAction)myQuitButtonPressed:(UIButton *)sender {
    exit(0);
}

- (IBAction)myFirefliesPressed:(UIButton *)sender{
    myScene2.myShapeType = 9;
    myScene2.myShapeNumber = [NSNumber numberWithInt:9];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myFirefliesParticle: @"Sparkles.mp3"];
};

- (IBAction)myFlagPressed:(UIButton *)sender{
    myScene2.myShapeType = 11;
    myScene2.myShapeNumber = [NSNumber numberWithInt:11];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myFlagNode: @"Flag.mp3"];
};


- (IBAction)myFiretruckPressed:(UIButton *)sender{
    myScene2.myShapeType = 12;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myFiretruckNode: @"Firetruck.mp3"];
};


- (IBAction)myAmbulancePressed:(UIButton *)sender{
    myScene2.myShapeType = 13;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myAmbulanceNode: @"Ambulance.mp3"];
};

- (IBAction)myAirplanePressed:(UIButton *)sender{
    myScene2.myShapeType = 14;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myAirplaneNode: @"Airplane.mp3"];
};

- (IBAction)myTowtruckPressed:(UIButton *)sender{
    myScene2.myShapeType = 15;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myTowtruckNode: @"Towtruck.mp3"];
};
- (IBAction)mySubmarinePressed:(UIButton *)sender{
    myScene2.myShapeType = 16;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.mySubmarineNode: @"Submarine.mp3"];
};
- (IBAction)myHelicopterPressed:(UIButton *)sender{
    myScene2.myShapeType = 17;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myHelicopterNode: @"Helicopter.mp3"];
};
- (IBAction)myBulldozerPressed:(UIButton *)sender{
    myScene2.myShapeType = 18;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myBulldozerNode: @"Bulldozer.mp3"];
};
- (IBAction)myCementMixerPressed:(UIButton *)sender{
    myScene2.myShapeType = 19;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myCementMixerNode: @"Cement Mixer.mp3"];
};
- (IBAction)myPoliceCarPressed:(UIButton *)sender{
    myScene2.myShapeType = 20;
    myScene2.myShapeNumber = [NSNumber numberWithInt:myScene2.myShapeType];
    [[self.view viewWithTag:9999] setHidden:YES];
    [myScene2 myMakeShapeIndicator:myScene2.myPoliceCarNode: @"Police Car.mp3"];
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
