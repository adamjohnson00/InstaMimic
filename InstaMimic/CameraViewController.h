//
//  CameraViewController.h
//  InstaMimic
//
//  Created by Adam Johnson on 6/9/15.
//  Copyright (c) 2015 Adam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)openCamera:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end
