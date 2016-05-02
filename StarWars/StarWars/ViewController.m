//
//  ViewController.m
//  StarWars
//
//  Created by Ethan Hess on 4/28/16.
//  Copyright © 2016 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "NetworkController.h"
#import "Constants.h"
#import "Planet.h"
#import "Person.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *planetArray;
@property (nonatomic, strong) NSArray *personArray;
@property (nonnull, strong) UISegmentedControl *segController;

//add segmented control to make different API calls then have option to filter array with predicate

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        
//        
//    });

    
    
    [self setUpTableView];
    
    [self setUpSegController];
}

- (void)setUpSegController {
    
    self.segController = [[UISegmentedControl alloc]initWithItems:@[@"Planets", @"People"]];
    [self.segController setFrame:CGRectMake(50, 50, self.view.frame.size.width -100, 50)];
    [self.segController addTarget:self action:@selector(segValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.segController setSelectedSegmentIndex:0];
    [self.view addSubview:self.segController];
    
}

- (void)setUpTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self registerTableView:self.tableView];
    [self.view addSubview:self.tableView];
}

- (void)registerTableView:(UITableView *)tableView {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.segController.selectedSegmentIndex == 0) {
        
        return self.planetArray.count;
        
    } else if (self.segController.selectedSegmentIndex == 1) {
        
        return self.personArray.count;
    }
    
    else {
        
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (self.segController.selectedSegmentIndex == 0) {
    
        Planet *planet = self.planetArray[indexPath.row];
    
        cell.textLabel.text = planet.name;
        
    }
    
    else if (self.segController.selectedSegmentIndex == 1) {
        
        Person *person = self.personArray[indexPath.row];
        
        cell.textLabel.text = person.name;
    }
    
    return cell;
}

- (void)segValueChanged:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        [[NetworkController sharedInstance] getStarWarsInfo:@"planets" completion:^(NSArray *starWarsArray) {
            
            self.planetArray = starWarsArray;
            [self refresh];
        }];
        
    } else if (sender.selectedSegmentIndex == 1) {
        
        [[NetworkController sharedInstance]getStarWarsInfo:@"people" completion:^(NSArray *starWarsArray) {
            
            self.personArray = starWarsArray;
            [self refresh];
        }]; 
    }
     
}

- (void)refresh {
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
