//
//  FirstViewController.m
//  transitionDemo
//
//  Created by Osvaldo Sabina on 7/22/14.
//  Copyright (c) 2014 Ozzie Sabina. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (nonatomic,assign) BOOL isPresenting;

- (IBAction)onSecondButton:(id)sender;

@end

@implementation FirstViewController

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

- (IBAction)onSecondButton:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc]init];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
    
    
}




- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    self.isPresenting = YES;
    return self;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    self.isPresenting = NO;
    return self;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}


// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 3;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIView *containerView = [transitionContext containerView];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    if (self.isPresenting) {
        toViewController.view.alpha = 0;
        toViewController.view.transform = CGAffineTransformMakeScale(0,0);
        
        [containerView addSubview:toViewController.view];
        
        [UIView animateWithDuration:3.0 animations:^{
            toViewController.view.alpha = 1;
            toViewController.view.transform = CGAffineTransformMakeScale(0.9,0.9);
        }completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    } else {
        fromViewController.view.alpha = 1;
        fromViewController.view.transform = CGAffineTransformMakeScale(0.9,0.9);
        
        [UIView animateWithDuration:3.0 animations:^{
            fromViewController.view.alpha = 0;
            fromViewController.view.transform = CGAffineTransformMakeScale(0,0);
        }completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
            [fromViewController removeFromParentViewController];
        }];

    }
}

@end
