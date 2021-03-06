//
//  OuterSpaceTableViewController.h
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/20/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AstronomicalData.h"
#import "LRCAddSpaceObjectViewController.h"

@interface OuterSpaceTableViewController : UITableViewController <LRCAddSpaceObjectViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *planets;
@property (nonatomic, strong) NSMutableArray *addedPlanets; 

@end
