//
//  LRCSpaceObject.h
//  OutOFThisWorld
//
//  Created by Luis Carbuccia on 7/20/14.
//  Copyright (c) 2014 Luis Carbuccia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LRCSpaceObject : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *interestingFact;
@property (nonatomic, strong) UIImage *spaceImage;

- (id) initWithData:(NSDictionary *)data andImage:(UIImage *)image;

@end
