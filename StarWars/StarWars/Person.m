//
//  Person.m
//  StarWars
//
//  Created by Ethan Hess on 5/2/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "Person.h"

static NSString * const eyeColorKey = @"eye_color";
static NSString * const genderKey = @"gender";
static NSString * const nameKey = @"name";

@implementation Person

    
- (id)initWithDictionary:(NSDictionary *)personDictionary {
        
        self = [super init];
        
        if (self) {
            
            self.name = personDictionary[nameKey];
            self.gender = personDictionary[genderKey];
            self.eyeColor = personDictionary[eyeColorKey];
            
        }
    
        return self;
}
    


@end
