//
//  NetworkController.m
//  StarWars
//
//  Created by Ethan Hess on 4/28/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "NetworkController.h"
#import "Planet.h"
#import "Person.h"

@implementation NetworkController

+ (NetworkController *)sharedInstance {
    static NetworkController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [NetworkController new];
    });
    
    return sharedInstance;
    
}

- (void)getStarWarsInfo:(NSString *)parameter completion:(void (^)(NSArray *starWarsArray))completion {
    
    NSURL *url = [NSURL URLWithString:BASE_URL];
    
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:url];
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [sessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObject:@"application/json"]];
    
    
    [sessionManager GET:parameter parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //serialize results here then init with planet dictionary
        
        if ([parameter isEqualToString:@"planets"]) {
            
            NSMutableArray *planetArray = [[NSMutableArray alloc]init];
            
            NSArray *responseResults = responseObject[@"results"];
            
            for (NSDictionary *dictionary in responseResults) {
                
                Planet *planet = [[Planet alloc]initWithDictionary:dictionary];
                
                [planetArray addObject:planet];
            }
            
            
            completion(planetArray);
            
        }
        
        else if ([parameter isEqualToString:@"people"]) {
            
            NSMutableArray *personArray = [[NSMutableArray alloc]init];
            
            NSArray *responseResults = responseObject[@"results"];
            
            for (NSDictionary *dictionary in responseResults) {
                
                Person *person = [[Person alloc]initWithDictionary:dictionary];
                
                [personArray addObject:person];
                
            }
            
            completion(personArray);
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error.localizedDescription); 
        
    }];
}

@end
