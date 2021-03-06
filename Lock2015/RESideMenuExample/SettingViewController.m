//
//  SettingViewController.m
//  IntelLock
//
//  Created by shen on 15/7/7.
//  Copyright (c) 2015年 shen. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@property UITableView *tableView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:202/255.0 blue:101/255.0 alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:nil
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"burger"]];
    
    [self addtableview];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)addtableview{
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)+40) style:UITableViewStyleGrouped];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    
    NSArray *items =[[NSArray alloc] initWithObjects:@"靠近自动解锁",@"防盗鸣笛",@"摔倒通知亲友",nil];
    cell.textLabel.text = items[[indexPath row]];
    
    UISwitch *switchview = [[UISwitch alloc] initWithFrame:CGRectZero];
    cell.accessoryView = switchview;
    [switchview addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    switchview.tag=[indexPath row];
    return cell;
}

-(void)switchAction:(id)sender{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"switchButton %i turn on",switchButton.tag);
    }else {
        NSLog(@"switchButton %i turn off",switchButton.tag);
    }
    
}

- (CGFloat)tableView:(UITableView *)atableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
