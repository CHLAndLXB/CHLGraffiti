//
//  ViewController.m
//  CHLGraffiti
//
//  Created by huochaihy on 2016/11/14.
//  Copyright © 2016年 CHLdemo.com. All rights reserved.
//

#import "ViewController.h"
#import "MWPointView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MWPointView * pointView = [[MWPointView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    pointView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pointView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
