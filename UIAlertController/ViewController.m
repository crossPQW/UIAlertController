//
//  ViewController.m
//  UIAlertController
//
//  Created by 黄少华 on 15/7/24.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *seguement;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}
- (IBAction)start:(UIButton *)sender {
    
    UIAlertControllerStyle style;
    switch (self.seguement.selectedSegmentIndex) {
        case 0:
            style = UIAlertControllerStyleAlert;
            break;
            
        case 1:
            style = UIAlertControllerStyleActionSheet;
            break;
        default:
            break;
    }
    
    //初始化alertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"TITLE" message:@"MESSAGE" preferredStyle:style];
    
    
    //初始化3个alertAction,block里面直接是点击了该选项的回调
    //UIAlertActionStyleDefault默认样式
    UIAlertAction *defaultItem = [UIAlertAction actionWithTitle:@"defaultItem" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"点击了defaultItem");
    }];
    //UIAlertActionStyleCancel取消按钮,无论添加顺序如何,cancle强制显示在最下面
    UIAlertAction *cancaleItem = [UIAlertAction actionWithTitle:@"cancaleItem" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"点击了cancaleItem");
    }];
    //UIAlertActionStyleDestructive警示样式,红色字体
    UIAlertAction *destructiveItem = [UIAlertAction actionWithTitle:@"destructiveItem" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"点击了destructiveItem");
    }];
    
    //给alertcontroller添加action事件,会按照添加顺序创建选项
    [alertController addAction:defaultItem];
    [alertController addAction:cancaleItem];
    [alertController addAction:destructiveItem];
    
    //如果是UIAlertControllerStyleAlert样式,还可以添加输入框
    if (style == UIAlertControllerStyleAlert) {
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.font = [UIFont fontWithName:@"AvenirNext-Medium" size:textField.font.pointSize];
            textField.placeholder = @"enjoy coding";
        }];
    }
    
    //弹出alert只需要modal出alertController即可
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
