//
//  SecondViewController.m
//  transitionDemo
//
//  Created by Osvaldo Sabina on 7/22/14.
//  Copyright (c) 2014 Ozzie Sabina. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

- (IBAction)onDismissButton:(id)sender;

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDismissButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
