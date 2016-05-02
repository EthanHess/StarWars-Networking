//
//  Person.h
//  StarWars
//
//  Created by Ethan Hess on 5/2/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *eyeColor;
@property (nonatomic, strong) NSString *gender;

- (id)initWithDictionary:(NSDictionary *)personDictionary;

@end
