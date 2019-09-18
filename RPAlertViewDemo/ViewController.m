//
//  ViewController.m
//  RPAlertViewDemo
//
//  Created by 博信科技 on 2019/7/24.
//  Copyright © 2019 西安博信信息科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "RPAlertViewController+Animation.h"

@interface ViewController ()

@property (assign, nonatomic) NSInteger itemNumber;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickShowOnlyOKBtn:(id)sender {
    RPAlertViewController *alertView = [[RPAlertViewController alloc] initWithMode:showRoot];
    [alertView configAlertOnlyOneBtn:@"title" body:@"body" btnTitle:@"OK"];
    alertView.modalPresentationStyle = UIModalPresentationCustom;
    alertView.oneBtnBlock = ^{
        
    };
    [self presentViewController:alertView animated:true completion:nil];
}

- (IBAction)clickCancelAndOKBtn:(id)sender {
    RPAlertViewController *alertView = [[RPAlertViewController alloc] initWithMode:showRoot];
    [alertView configMixedAlert:@"title" body:@"body" leftBtnTitle:@"cancel" rightBtnTitle:@"OK"];
    alertView.modalPresentationStyle = UIModalPresentationCustom;
    alertView.leftBtnBlock = ^{
        
    };
    alertView.rightBtnBlock = ^{
        
    };
    [self presentViewController:alertView animated:true completion:nil];
}

- (IBAction)clickAttributesStringBtn:(id)sender {
    NSString *fristChar = @"Since you are reported by multiple users, your account is forbidden from matching and chatting for  ";
    NSString *secondChar = @"7 day";
    NSString *thridChar = @"\n\n\t Please chat and behaviour properly, or your account will be banned forever.";
    NSString *string = [NSString stringWithFormat:@"%@%@.%@",fristChar,secondChar,thridChar];
    NSMutableAttributedString *bodyText = [[NSMutableAttributedString alloc] initWithString:string];
    [bodyText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:248/255.0 green:92/255.0 blue:92/255.0 alpha:1] range:[string rangeOfString:secondChar]];
    [bodyText addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Semibold" size:16] range:NSMakeRange(0, bodyText.length)];
    
    
    RPAlertViewController *alertView = [[RPAlertViewController alloc] initWithMode:showRoot];
    [alertView configAttributedStringAlertOnlyOneBtnTitle:@"title" body:bodyText btnText:@"OK"];
    alertView.modalPresentationStyle = UIModalPresentationCustom;
    alertView.oneBtnBlock = ^{
        
    };
    [self presentViewController:alertView animated:true completion:nil];
}


- (NSInteger)itemforNumberWithPickView {
    return  self.itemNumber;
}

@end
