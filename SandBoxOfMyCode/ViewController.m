//
//  ViewController.m
//  SandBoxOfMyCode
//
//  Created by chenxingwang on 16/4/8.
//  Copyright © 2016年 chenxingwang. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"
#import <ContactsUI/CNContactViewController.h>
#import <ContactsUI/CNContactPickerViewController.h>

@interface ViewController ()


{
    UIWebView *webView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    CNContactPickerViewController
        
    
    NSString *string = @"hahahaha";
    
    
    NSString *Urlstring = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    
    NSLog(@"%@",Urlstring);
    
    
    
    
    
    [self layoutLoactionWebView];
    
    
//    NSString *urlStr = [string ]
//    NSString *urlStr2 = [@http://v.juhe.cn/weather/index?format=2&cityname=北京&key=88e194ce72b455563c3bed01d5f967c5 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

}




- (void) layoutLoactionWebView{
    
    self->webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    
    //    self.webView.frame = self.view.frame;
    
    //    CGRect frame = CGRectMake(0, 0, 375, 667);
    //
    //    self.webView.frame = frame;
    
    [self.view addSubview:self->webView];
    
    /**
     *  @author chenxingwang, 16-05-10 15:05:17
     *
     *  加载本地 html
     */
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"index"
                                                     ofType:@"html"];
    
    NSURL* url = [NSURL fileURLWithPath:path];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url] ;
    
    [webView loadRequest:request];
    
}


///Users/chenxingwang/Desktop/SandBoxOfMyCode/SandBoxOfMyCode/ViewController.m:24:26: 'stringByAddingPercentEscapesUsingEncoding:' is deprecated: first deprecated in iOS 9.0 - Use -stringByAddingPercentEncodingWithAllowedCharacters: instead, which always uses the recommended UTF-8 encoding, and which encodes for a specific URL component or subcomponent since each URL component or subcomponent has different rules for what characters are valid.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark -
#pragma mark - 二维码生成及保存
#pragma mark -


- (void)test{
    
    NSString *str= @"itms-apps://itunes.apple.com/us/app/id1048004602?mt=8";//跳转到itunesStore
    
    UIImage * image = [self generateQRCode:str width:150.0 height:150.0];
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(imageSavedToPhotosAlbum: didFinishSavingWithError: contextInfo:), nil);
    
}

/**
 *  二维码生成测试
 *
 *  @param code   字符串
 *  @param width  宽
 *  @param height 高
 *
 *  @return UIImage (返回为CIImage 转化为 image后调用,测试可用)
 */

- (UIImage *)generateQRCode:(NSString *)code width:(CGFloat)width height:(CGFloat)height {
    
    // 生成二维码图片
    CIImage *qrcodeImage;
    NSData *data = [code dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    qrcodeImage = [filter outputImage];
    
    // 消除模糊
    CGFloat scaleX = width / qrcodeImage.extent.size.width; // extent 返回图片的frame
    CGFloat scaleY = height / qrcodeImage.extent.size.height;
    CIImage *transformedImage = [qrcodeImage imageByApplyingTransform:CGAffineTransformScale(CGAffineTransformIdentity, scaleX, scaleY)];
    
    return [self makeUIImageFromCIImage:transformedImage];
}

- (UIImage *)makeUIImageFromCIImage:(CIImage *)ciImage {
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:ciImage fromRect:[ciImage extent]];
    
    UIImage* uiImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    return uiImage;
}


- (void)imageSavedToPhotosAlbum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *) contextInfo {
    
    NSString *message;
    NSString *title;
    
    
    if (!error) {
        title = @"恭喜";
        message = @"成功保存到相册";
    } else {
        title = @"失败";
        message = [error description];
        
    }
    /**uialertview desprecated*/
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
//    [alert show];
}


@end
