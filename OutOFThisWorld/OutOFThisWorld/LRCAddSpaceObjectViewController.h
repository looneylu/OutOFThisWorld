//
//  LRCAddSpaceObjectViewController.h
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/21/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRCSpaceObject.h"

@protocol LRCAddSpaceObjectViewControllerDelegate <NSObject>

@required
- (void) addSpaceObject:(LRCSpaceObject*)spaceObject;
- (void) didCancel;

@end

@interface LRCAddSpaceObjectViewController : UIViewController

@property (weak, nonatomic) id <LRCAddSpaceObjectViewControllerDelegate> delegate;

- (LRCSpaceObject*) returnNewSpaceObject;

@end
