//
//  ViewController.m
//  FEGCDStudy
//
//  Created by keso on 2017/7/16.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testGCD1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testGCD1 {
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"FlyElephant---执行了");
    });
    



}

- (void)testGlobalQueue {
    
    dispatch_queue_t globalQueue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_sync(globalQueue1, ^{
        sleep(2);
        NSLog(@"执行任务1");
    });
    
    dispatch_async(globalQueue1, ^{
        sleep(1);
        NSLog(@"执行任务2");
    });
    
    NSLog(@"主队列执行任务");
    
    
    dispatch_queue_t globalQueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
}


@end
