//
//  ViewController.m
//  CompletionPractice
//
//  Created by Gyroball on 2017/09/10.
//  Copyright © 2017年 Gyroball. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIAlertController *alertController;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - Gesture
- (IBAction)tappedAutoDisappear:(id)sender
{
    [self showHogeAlert];
    [self performSelector:@selector(shouldTransition) withObject:self afterDelay:3.0f];
}

#pragma mark - Transition
- (void)shouldTransition
{
    [self dismissAlert:^(BOOL finish)
    {
        NextViewController *nextViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NextViewController"];
        [self.navigationController pushViewController:nextViewController animated:YES];
    }];
}

#pragma mark - Private
- (void)showHogeAlert
{
    _alertController = [UIAlertController alertControllerWithTitle:@"Discription" message:@"Disappear an alert after transition." preferredStyle:UIAlertControllerStyleAlert];
    [self.navigationController presentViewController:_alertController  animated:YES completion:nil];
}

- (void)dismissAlert:(void(^)(BOOL))completion
{
    [_alertController dismissViewControllerAnimated:YES completion:
     ^{
         completion(YES);
     }];
}
@end
