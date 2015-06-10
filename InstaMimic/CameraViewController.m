//
//  CameraViewController.m
//  InstaMimic
//
//  Created by Adam Johnson on 6/9/15.
//  Copyright (c) 2015 Adam. All rights reserved.
//

#import "CameraViewController.h"


@interface CameraViewController ()


@end

@implementation CameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (IBAction)openCamera:(UIButton *)sender
{
    [self showCamera];
}


-(BOOL) launchCameraControllerFromViewController: (UIViewController*)controller usingDelegate: (id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>) delegate
{
    BOOL truefalse = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];

    if (!truefalse || delegate == nil || controller == nil)
    {
        NSLog(@"No can do, delegate/camera/view controller doesn't exist!");
        return NO;
    }

    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];

    cameraController.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraController.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
    cameraController.allowsEditing = NO;
    cameraController.delegate = delegate;

    [controller presentViewController:cameraController animated:YES completion:nil];

    return TRUE;
}


-(void)showCamera
{
    UIImagePickerController *cameraController = [[UIImagePickerController alloc] init];

    //TODO: Use the camera
    cameraController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    cameraController.allowsEditing = YES;
    cameraController.delegate = self;

    [self presentViewController:cameraController animated:YES completion:nil];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];

    self.imageView.image = chosenImage;

    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
