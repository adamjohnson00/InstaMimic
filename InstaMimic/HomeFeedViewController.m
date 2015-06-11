//
//  HomeFeedViewController.m
//  InstaMimic
//
//  Created by Adam Johnson on 6/9/15.
//  Copyright (c) 2015 Adam. All rights reserved.
//

#import "HomeFeedViewController.h"

@interface HomeFeedViewController ()

@end

@implementation HomeFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    PFObject *gameScore = [PFObject objectWithClassName:@"Game Time"];
    gameScore[@"score"] = @1337;
    gameScore[@"playerName"] = @"Adam";
    gameScore[@"cheat"] = @NO;
    
    // Do any additional setup after loading the view.
//    PFUser *user = [PFUser user];
//    user.username = @"my name";
//    user.password = @"my pass";
//    user.email = @"email@example.com";
//    
//    // other fields can be set if you want to save more information
//    user[@"phone"] = @"650-555-0000";
//    
//    PFUser* user = [PFUser logInWithUsername:@"my name" password:@"my pass" error:nil];
//    
//    if (user == nil) {
//        //
//    }
//    else{
//        [self performSegueWithIdentifier:@"BackToLogInSegue" sender:self];
//    }
    
    
//    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (!error) {
//            NSLog(@"This user signed in correctly");
//        } else {
//            NSString *errorString = [error userInfo][@"error"];
//            // Show the errorString somewhere and let the user try again.
//            NSLog(@"%@", errorString);
//        }
//    }];
//    if ([PFUser currentUser] == nil) {
//        [self performSegueWithIdentifier:@"BackToLogInSegue" sender:self];
//    } else {
//        NSLog(@"Go to HomeFeedViewController");
//    }
        //else {
//        [self performSegueWithIdentifier:@"LoginSegue" sender:self];
//    }
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([PFUser currentUser] == nil) {
//        [self performSegueWithIdentifier:@"BackToLogInSegue" sender:sender];
//    } 
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
