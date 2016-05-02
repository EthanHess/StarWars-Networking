//
//  Planet.m
//  StarWars
//
//  Created by Ethan Hess on 4/28/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "Planet.h"

static NSString * const nameKey = @"name";
static NSString * const popKey = @"population";
static NSString * const gravityKey = @"gravity";
static NSString * const diameterKey = @"diameter";
static NSString * const climateKey = @"climate";

@implementation Planet

- (id)initWithDictionary:(NSDictionary *)planetDictionary {
    
    self = [super init];
    
    if (self) {
        
        self.population = [planetDictionary[popKey]integerValue];
        
        self.diameter = [planetDictionary[diameterKey]integerValue];
        
        self.name = planetDictionary[nameKey];
        self.climate = planetDictionary[climateKey];
        self.gravity = planetDictionary[gravityKey]; 
        
        
    }
    
    return self;
    
}


@end
