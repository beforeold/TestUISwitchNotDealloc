//
//  ViewController.m
//  TestUISwitchNotDealloc
//
//  Created by 席萍萍 on 2016/11/10.
//  Copyright © 2016年 Yundi. All rights reserved.
//

#import "ViewController.h"

#import "BOSwitch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 查看是否dealloc
    [BOSwitch new];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
