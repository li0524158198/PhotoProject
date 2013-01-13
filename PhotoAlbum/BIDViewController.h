//
//  BIDViewController.h
//  PhotoAlbum
//
//  Created by Mctu on 13-1-13.
//  Copyright (c) 2013年 Mctu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController<UIGestureRecognizerDelegate>
@property(nonatomic,retain) UIImageView *monkeyImageView;
@property(nonatomic,retain) UIPinchGestureRecognizer * pinchGesture;
@property(nonatomic,retain) UIPanGestureRecognizer * panGesture;
@property(nonatomic,retain) UIRotationGestureRecognizer *rotationGesture;
@property(nonatomic,retain) UITapGestureRecognizer *tapGetesture;


@end
