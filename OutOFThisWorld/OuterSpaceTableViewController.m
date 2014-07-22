//
//  OuterSpaceTableViewController.m
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/20/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import "OuterSpaceTableViewController.h"
#import "LRCSpaceObject.h"
#import "LRCSpaceImageViewController.h"
#import "LRCSpaceDataViewController.h"
#import "LRCAddSpaceObjectViewController.h"


@interface OuterSpaceTableViewController ()



@end

@implementation OuterSpaceTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets]){
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData [PLANET_NAME]];
        LRCSpaceObject *planet = [[LRCSpaceObject alloc] initWithData:planetData andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }

    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    NSString *firstColor = @"red";
//    [myDictionary setObject:firstColor forKey:@"Firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"Ocean color"];
//    [myDictionary setObject:@"yellow" forKey:@"Sun color"];
//    
//    NSLog(@"%@", myDictionary);
//    
//    NSLog(@"%@", [myDictionary objectForKey:@"Ocean color"]);


}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]])
    {
        if ([segue.destinationViewController isKindOfClass:[LRCSpaceImageViewController class]])
        {
            LRCSpaceImageViewController *nextViewController = segue.destinationViewController;
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            LRCSpaceObject *selectedObject;
            
            if (path.section == 0)
                selectedObject = [self.planets objectAtIndex:path.row];
            else if (path.section == 1)
                selectedObject = [self.addedPlanets objectAtIndex:path.row];
            
            nextViewController.spaceObject = selectedObject;
        }
    }
    
    if ([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[LRCSpaceDataViewController class]])
        {
            LRCSpaceDataViewController *targetViewController = segue.destinationViewController;
            NSIndexPath *path = sender;
            LRCSpaceObject *selectedObject;
            if (path.section == 0)
                selectedObject = [self.planets objectAtIndex:path.row];
            else if (path.section == 1)
                selectedObject = [self.addedPlanets objectAtIndex:path.row];
            
            targetViewController.spaceObject = selectedObject;
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[LRCAddSpaceObjectViewController class]])
    {
        LRCAddSpaceObjectViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// #warning Potentially incomplete method implementation.
    
    // Return the number of sections.
    
    // if there are objects in addedPlanets, there should be 2 sections.
    // otherwise, one 1 section
    if (self.addedPlanets)
        return 2;
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// #warning Incomplete method implementation.
    
    // Return the number of rows in the section.
    if (section == 1)
        return [self.addedPlanets count];
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 1)
    {
        LRCSpaceObject *planet = [self.addedPlanets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    else
    {
        // Access the LRCSPaceObject from planets array. Use the LRCSpaceObject's
        // properties
        LRCSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
        
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:.5 alpha:1.0];
    
    return cell;
}

#pragma mark - LRCAddSpaceObjectViewController Delegate

- (void)didCancel
{
    NSLog(@"Did cancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) addSpaceObject:(LRCSpaceObject *)spaceObject
{
    if (!self.addedPlanets)
    {
        self.addedPlanets = [[NSMutableArray alloc] init];
    }
    
    [self.addedPlanets addObject:spaceObject];
    
    [self.tableView reloadData];
    
    NSLog(@"addSpaceObject");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"pushToSpaceData" sender:indexPath];
}



@end
