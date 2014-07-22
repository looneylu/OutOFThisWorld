//
//  LRCAddSpaceObjectViewController.m
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/21/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "LRCAddSpaceObjectViewController.h"

@interface LRCAddSpaceObjectViewController ()

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

@end

@implementation LRCAddSpaceObjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *orionImage = [UIImage imageNamed:@"Orion.jpg"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:orionImage]; 
}

- (IBAction)cancelButtonPressed:(id)sender
{

}

- (IBAction)addButtonPressed:(id)sender
{

}

@end
