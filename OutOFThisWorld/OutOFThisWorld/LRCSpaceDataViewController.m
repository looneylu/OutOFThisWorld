//
//  LRCSpaceDataViewController.m
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/21/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "LRCSpaceDataViewController.h"
#import "LRCSpaceObject.h"

@interface LRCSpaceDataViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) LRCSpaceObject *spaceObject;

@end

@implementation LRCSpaceDataViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DataCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row)
    {
        case 0 :
            cell.textLabel.text = @"Nickname : ";
            cell.detailTextLabel.text = self.spaceObject.nickname;
            break;
        case 1 :
            cell.textLabel.text = @"Diameter (km):";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.diameter];
            break;
        case 2 :
            cell.textLabel.text = @"Gravitation Force:";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.gravitationalForce];
            break;
        case 3 :
            cell.textLabel.text = @"Length of Days (in hours)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.dayLength];
            break;
        case 4 :
            cell.textLabel.text = @"Length of Years (in days)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.yearLength];
            break;
        case 5 :
            cell.textLabel.text = @"Temperature (celcius)";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f", self.spaceObject.temperature];
            break;
        case 6 :
            cell.textLabel.text = @"Number of Moons";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", self.spaceObject.numberOfMoons];
            break;
        case 7 :
            cell.textLabel.text = @"Interesting Fact";
            cell.detailTextLabel.text = self.spaceObject.interestingFact;
            break;
        default :
            break;
        
    }
    
    return cell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

@end
