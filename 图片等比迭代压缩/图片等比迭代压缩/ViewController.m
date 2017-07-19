//
//  ViewController.m
//  图片等比迭代压缩
//
//  Created by 朱辉 on 2017/5/9.
//  Copyright © 2017年 WD. All rights reserved.
//

#import "ViewController.h"
#import "WDImageScaleTool.h"

#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{

    NSString *logString;
    
}
@property (nonatomic, strong)  UILabel *logLable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    logString = @"";

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(0, 0, 120, 60);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor darkGrayColor];
    [btn setTitle:@"开始压缩图片" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
    
    
    _logLable = [[UILabel alloc] init];
    _logLable.frame = CGRectMake(0, CGRectGetMaxY(btn.frame) + 20, self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(btn.frame) - 20);
    _logLable.textColor = [UIColor whiteColor];
    _logLable.text = [NSString stringWithFormat:@"hahhhahh"];
    _logLable.font = [UIFont systemFontOfSize:16];
    _logLable.numberOfLines = 0;
    _logLable.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_logLable];
    
    [self showLogMessege:@"点击按钮开始压缩图片"];
    
}

- (void)begin
{
    
    UIImage *image = [UIImage imageNamed:@"测试图片.jpg"];
    CGSize maxSize = CGSizeMake(600, 800);
    WDImageScaleTool *imageTool = [[WDImageScaleTool alloc] init];
    UIImage *imageEnd = [imageTool WDImageFormatAndScaleRecycleCompressionWithImage:image maxSize:maxSize maxDataByte:100];
    [self showLogMessege:@"图片压缩成功!!!"];

    
    UIImage *imagesave = imageEnd;
    NSString *path_sandox = NSHomeDirectory();
    //设置一个图片的存储路径
    NSString *imagePath = [path_sandox stringByAppendingString:@"/Documents/test.png"];
    NSString *imagePathJpg = [path_sandox stringByAppendingString:@"/Documents/test.jpg"];
    
    //把图片直接保存到指定的路径（同时应该把图片的路径imagePath存起来，下次就可以直接用来取）
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
    [self showLogMessege:@"图片写沙河PNG格式成功!!!"];

    [UIImageJPEGRepresentation(imagesave,0.7) writeToFile:imagePathJpg atomically:YES];
    [self showLogMessege:@"图片写沙河JPG格式成功!!!"];

    [self showLogMessege:[NSString stringWithFormat:@"沙河路径:%@",path_sandox]];
    [self showLogMessege:@"请到沙河获取压缩过后的图片!!!"];

}
- (void)showLogMessege:(NSString *)mes
{
    logString = [logString stringByAppendingString:@"\n"];
    logString = [logString stringByAppendingString:mes];
    _logLable.text = logString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
