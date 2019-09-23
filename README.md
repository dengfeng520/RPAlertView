<h1>RPAlertView</h1>

 
* iOS 9+

* license MIT

* Xcode 10+

<h2>Requirements</h2>

**RPAlertView works on iOS 9+ to build.**

<h2>Adding RPAlertView to your project</h2>

**CocoaPods is the recommended way to add RPAlertView to your project.**

**1、Add a pod entry for RPAlertView to your project Podfile**

```
pod 'RPAlertView'

```
or

```
pod 'RPAlertView', :git => 'https://github.com/dengfeng520/RPAlertView'
```

**2、Install the pod by running**

```
pod install
```


<h2>Usage</h2>

```
#import "RPAlertViewController+Animation.h"
```

> OnlyOneBtnMode


```
RPAlertViewController *alertView = [[RPAlertViewController alloc] initWithMode:showRoot];
[alertView configAlertOnlyOneBtn:@"title" body:@"body" btnTitle:@"OK"];
alertView.modalPresentationStyle = UIModalPresentationCustom;
alertView.oneBtnBlock = ^{
        
};
[self presentViewController:alertView animated:true completion:nil];
```

> CancelAndOKMode

```
RPAlertViewController *alertView = [[RPAlertViewController alloc] initWithMode:showRoot];
[alertView configMixedAlert:@"title" body:@"body" leftBtnTitle:@"cancel" rightBtnTitle:@"OK"];
alertView.modalPresentationStyle = UIModalPresentationCustom;
alertView.leftBtnBlock = ^{
        
};
alertView.rightBtnBlock = ^{
        
};
[self presentViewController:alertView animated:true completion:nil];
```

> NSMutableAttributedString


```
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
```

![demo1](https://github.com/dengfeng520/RPAlertView/blob/master/demo1.png?raw=true)
![AlertDemo1](https://github.com/dengfeng520/RPAlertView/blob/master/demo2.png?raw=true)
![AlertDemo1](https://github.com/dengfeng520/RPAlertView/blob/master/demo3.png?raw=true)



