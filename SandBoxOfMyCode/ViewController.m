//
//  ViewController.m
//  SandBoxOfMyCode
//
//  Created by chenxingwang on 16/4/8.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//

#import "ViewController.h"
#import <ContactsUI/CNContactViewController.h>
#import <ContactsUI/CNContactPickerViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CNContactPickerViewController
    
    
    
    
    NSString *string = @"hahahaha";
    
    
    NSString *Urlstring = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    
    NSLog(@"%@",Urlstring);
    
    
    
    
    
    
    
    
//    NSString *urlStr = [string ]
//    NSString *urlStr2 = [@http://v.juhe.cn/weather/index?format=2&cityname=北京&key=88e194ce72b455563c3bed01d5f967c5 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

}

///Users/chenxingwang/Desktop/SandBoxOfMyCode/SandBoxOfMyCode/ViewController.m:24:26: 'stringByAddingPercentEscapesUsingEncoding:' is deprecated: first deprecated in iOS 9.0 - Use -stringByAddingPercentEncodingWithAllowedCharacters: instead, which always uses the recommended UTF-8 encoding, and which encodes for a specific URL component or subcomponent since each URL component or subcomponent has different rules for what characters are valid.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (void)test{

    
    
}

@end
