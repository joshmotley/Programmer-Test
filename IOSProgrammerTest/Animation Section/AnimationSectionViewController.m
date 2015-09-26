//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"

@interface AnimationSectionViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

@end

@implementation AnimationSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    UIPanGestureRecognizer *PanGesture = [[UIPanGestureRecognizer alloc]
                                               initWithTarget:self action:@selector(handlePan:)];
    
    [self.logoView addGestureRecognizer:PanGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

-(void)handlePan:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint translation = [panGestureRecognizer translationInView:panGestureRecognizer.view];
    
    panGestureRecognizer.view.center = CGPointMake(panGestureRecognizer.view.center.x+translation.x, panGestureRecognizer.view.center.y+translation.y);
    [panGestureRecognizer setTranslation:CGPointMake(0, 0) inView:panGestureRecognizer.view];
    
    UIGestureRecognizerState state = [panGestureRecognizer state];
    
    if (state == UIGestureRecognizerStateBegan) {
    [self runSpinAnimationOnView:self.logoView duration:10 rotations:1];
        [UIView animateWithDuration:1
                              delay:0
                            options:UIViewKeyframeAnimationOptionAutoreverse | UIViewKeyframeAnimationOptionRepeat
                         animations:^{
                             self.logoView.transform = CGAffineTransformMakeScale(2, 2);
                         }
                         completion:nil];
    }else if(state == UIGestureRecognizerStateEnded){
        [self runSpinAnimationOnView:self.logoView duration:0 rotations:1];
        [UIView animateWithDuration:0
                              delay:0
                            options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             self.logoView.transform = CGAffineTransformMakeScale(1, 1);
                         }
                         completion:nil];
        
        
    }
    
}

- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (IBAction)spinAnimation:(id)sender {
    
    [self runSpinAnimationOnView:self.logoView duration:1 rotations:1];
   
}


@end
