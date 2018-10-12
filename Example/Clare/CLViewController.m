//
//  CLViewController.m
//  Clare
//
//  Created by zekail on 10/12/2018.
//  Copyright (c) 2018 zekail. All rights reserved.
//

#import "CLViewController.h"
#import <Clare/Clare.h>

@interface CLViewController ()

@end

@implementation CLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    [[[Clare sharedManager]settings]setLanguages:[[NSArray alloc]initWithObjects:@"ja_JP",@"zh_CN",@"en_US",@"zh_TW", @"zh_HK", @"vi_VN",@"tl_PH", nil]];
    [[Clare sharedManager] show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
