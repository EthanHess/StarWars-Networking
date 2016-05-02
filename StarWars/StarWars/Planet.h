//
//  Planet.h
//  StarWars
//
//  Created by Ethan Hess on 4/28/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Planet : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *climate;
@property (nonatomic, assign) NSInteger diameter;
@property (nonatomic, assign) NSInteger population;
@property (nonatomic, strong) NSString *gravity;

- (id)initWithDictionary:(NSDictionary *)planetDictionary; 

@end
