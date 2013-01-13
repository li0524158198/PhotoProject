//
//  BIDViewController.m
//  PhotoAlbum
//
//  Created by Mctu on 13-1-13.
//  Copyright (c) 2013年 Mctu. All rights reserved.
//

#import "BIDViewController.h"
//test
@interface BIDViewController ()
@end

@implementation BIDViewController

@synthesize panGesture = _panGesture;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.monkeyImageView = [[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"monkey.png"]]autorelease];
    self.monkeyImageView.userInteractionEnabled = YES;
    
    self.pinchGesture = [[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureAction:)]autorelease];
    self.pinchGesture.delegate = self;
    
    self.panGesture = [[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureAction:)] autorelease];
    self.panGesture.delegate = self;

    
    self.rotationGesture = [[[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureAction:)] autorelease];
    self.rotationGesture.delegate = self;
    
    self.tapGetesture = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGetestureAction:)] autorelease];
    self.tapGetesture.delegate = self;
    self.tapGetesture.numberOfTapsRequired = 2;
    self.tapGetesture.numberOfTouchesRequired = 1;
    
    [self.view addSubview:self.monkeyImageView];
    [self.monkeyImageView addGestureRecognizer:self.pinchGesture];
    [self.monkeyImageView addGestureRecognizer:self.panGesture];
    [self.monkeyImageView addGestureRecognizer:self.rotationGesture];
    [self.monkeyImageView addGestureRecognizer:self.tapGetesture];

}

-(void)pinchGestureAction:(UIPinchGestureRecognizer *) gesture
{
    NSLog(@"pich");
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform,gesture.scale,gesture.scale);
    gesture.scale = 1;
}

-(void)panGestureAction:(UIPanGestureRecognizer *) gesture
{
    NSLog(@"panch");
    CGPoint point = [gesture translationInView:self.view];
    gesture.view.center = CGPointMake(gesture.view.center.x + point.x, gesture.view.center.y + point.y);
    [gesture setTranslation:CGPointMake(0, 0) inView:self.view];
    
}

-(void)rotationGestureAction:(UIRotationGestureRecognizer *) gesture
{
    NSLog(@"rotation");
    gesture.view.transform = CGAffineTransformRotate(gesture.view.transform, gesture.rotation);
    gesture.rotation = 0;
}

-(void)tapGetestureAction:(UITapGestureRecognizer *) gesture
{
    gesture.view.transform = CGAffineTransformScale(gesture.view.transform, 2, 2);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return  YES;
}
- (void)dealloc
{
    if(_monkeyImageView)
    {
        [_monkeyImageView release];
        _monkeyImageView = nil;
    }
    
    if(_pinchGesture)
    {
        [_pinchGesture release];
        _pinchGesture = nil;
    }
    
    if(_panGesture)
    {
        [_panGesture release];
        _panGesture = nil;
    }
    
    if(_rotationGesture)
    {
        [_rotationGesture release];
        _rotationGesture = nil;
    }
    
    if(_tapGetesture)
    {
        [_tapGetesture release];
        _tapGetesture = nil;
    }
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
