//
//  NetworkController.h
//  StarWars
//
//  Created by Ethan Hess on 4/28/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import <AFNetworking.h>

@interface NetworkController : NSObject

+ (NetworkController *)sharedInstance;

- (void)getStarWarsInfo:(NSString *)parameter completion:(void (^)(NSArray *starWarsArray))completion;

@end
