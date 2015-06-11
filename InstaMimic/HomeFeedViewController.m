//
//  HomeFeedViewController.m
//  InstaMimic
//
//  Created by Adam Johnson on 6/9/15.
//  Copyright (c) 2015 Adam. All rights reserved.
//

#import "HomeFeedViewController.h"

@interface HomeFeedViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Stores image in variable braveheart.
    UIImage *braveheart = [UIImage imageNamed:@"braveheart"];

    // Convert to JPEG with 50% quality
    NSData* data = UIImageJPEGRepresentation(braveheart, 0.5f);

    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:data];

    // Save the image to Parse

    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // The image has now been uploaded to Parse. Associate it with a new object
            PFObject* newPhotoObject = [PFObject objectWithClassName:@"PhotoObject"];
            [newPhotoObject setObject:imageFile forKey:@"image"];

            [newPhotoObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (!error) {
                    NSLog(@"Saved");
                }
                else{
                    // Error
                    NSLog(@"Error: %@ %@", error, [error userInfo]);
                }
            }];
        }
    }];

    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
    {
        PFQuery *query = [PFQuery queryWithClassName:@"PhotoObject"];
        [query getObjectInBackgroundWithId:@"fbRKhhGpMW" block:^(PFObject *newPhotoObject, NSError *error)
        {

            if (!error)
            {
                PFFile *imageFile2 = [newPhotoObject objectForKey:@"image"];
                [imageFile2 getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
                {
                    if (!error)
                    {
                        self.imageView.image = [UIImage imageWithData:data];
                    }
                }];
            }

        }];
    }];

}
    //[object saveInBackground];


//    gameScore[@"playerName"] = @"Adam";
//    gameScore[@"cheat"] = @NO;
//    gameScore[@"name"] = @"Player 1";

    // Saves image to Parse.
    //[image saveInBackground];

//    PFQuery *query = [PFQuery queryWithClassName:@"GameTime"];
//    [query getObjectInBackgroundWithId:@"TgyDin75ZI" block:^(PFObject *gameScore, NSError *error)
//
//    {
//        NSLog(@"%@", gameScore);
//    }];

//    PFQuery *query2 = [PFQuery queryWithClassName:@"GameTime"];
//    [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
//    {
//        if (!error)
//        {
//            // The find succeeded. The first 100 objects are available in objects
//            NSLog(@"%@", objects);
//
//            for (PFObject *pfob in objects)
//            {
//                //NSLog(@"%@", pfob[@"name"]);
//                NSLog(@"%@", pfob[@"playerName"]);
//
//
//
//            }
//
//        }
//        else
//        {
//            // Log details of the failure
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];


//    int score = [[gameScore objectForKey:@"score"] intValue];
//    NSString *playerName = gameScore[@"playerName"];
//    BOOL cheatMode = [gameScore ]




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


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([PFUser currentUser] == nil) {
//        [self performSegueWithIdentifier:@"BackToLogInSegue" sender:sender];
//    } 
//}









@end
