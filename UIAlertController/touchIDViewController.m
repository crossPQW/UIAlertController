//
//  touchIDViewController.m
//  UIAlertController
//
//  Created by 黄少华 on 15/7/24.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "touchIDViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface touchIDViewController ()

@end

@implementation touchIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)touchIDClick:(id)sender {
    
    
    //使用之前,需要先获取上下文.
    LAContext *context = [[LAContext alloc] init];
    
    NSError *error;
    if (![context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"error:%@",error.localizedDescription);

        return;
    }
    
    //可用
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请验证您的指纹" reply:^(BOOL success, NSError *authenticationError) {
        
       dispatch_async(dispatch_get_main_queue(), ^{
           
           if (success) {
               NSLog(@"success");
           }else{
               NSLog(@"error == :%@",authenticationError);
           }
        
           
       }) ;
    }];
}

@end
