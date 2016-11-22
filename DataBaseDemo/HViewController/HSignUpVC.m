//
//  HSignUpVC.m
//  DataBaseDemo
//
//  Created by HY on 2016/11/16.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "HSignUpVC.h"
#import "HPersonModel.h"
@interface HSignUpVC ()
@property (nonatomic, retain)  UITextField *hAccountTextField;
@property (nonatomic, retain)  UITextField *hPasswordTextField;
@property (nonatomic, retain)  UIButton *hSingUpBtn;
@end

@implementation HSignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self initUI];
}


- (void)initUI{
    [self.view addSubview:self.hAccountTextField];
    [self.view addSubview:self.hPasswordTextField];
    [self.view addSubview:self.hSingUpBtn];
    self.hPasswordTextField.text = @"qqqqqq";
}

- (void)singUp{
    if (self.hAccountTextField.text.length > 0 && self.hPasswordTextField.text.length > 0) {
        
    }
    [self.hSingUpBtn jk_showIndicator];
    int randomx = arc4random() % 10;
    HPersonModel *model = [HPersonModel new];
    self.hAccountTextField.text = [NSString stringWithFormat:@"aliluya%d@qq.com",randomx];
    model.account = self.hAccountTextField.text;
//    model.pk = [model.account jk_md5String];
    model.name = [NSString stringWithFormat:@"aliluya%d",randomx];
    model.passWord = self.hPasswordTextField.text;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [model saveOrUpdate];
        [self.hSingUpBtn jk_hideIndicator];
    });
}

#pragma mark - UI

- (UITextField *)hAccountTextField
{
    if (_hAccountTextField == nil) {
        _hAccountTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 40, self.view.width-15*2, 40)];
        //        _hAccountTextField.delegate = self;
        _hAccountTextField.borderStyle = UITextBorderStyleRoundedRect;
        _hAccountTextField.placeholder = @"邮箱";
        //        _hAccountTextField.textColor = RGB(0x666666);
        _hAccountTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _hAccountTextField.secureTextEntry = NO;
        //        [_hAccountTextField setFont:HYGFontAvenir_Font(15)];
        _hAccountTextField.backgroundColor = [UIColor clearColor];
    }
    return _hAccountTextField;
}


- (UITextField *)hPasswordTextField
{
    if (_hPasswordTextField == nil) {
        _hPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, self.hAccountTextField.bottom+20, self.hAccountTextField.width, 40)];
        _hPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
        //        _hPasswordTextField.delegate = self;
        _hPasswordTextField.placeholder = @"密码";
        //        _hPasswordTextField.textColor = RGB(0x666666);
        _hPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _hPasswordTextField.secureTextEntry = YES;
        //        [_hPasswordTextField setFont:HYGFontAvenir_Font(15)];
        
    }
    return _hPasswordTextField;
}

- (UIButton *)hSingUpBtn{
    if(!_hSingUpBtn){
        WS(weakSelf)
        _hSingUpBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.hPasswordTextField.bottom+20, self.hPasswordTextField.width, 44)];
        [_hSingUpBtn setBackgroundColor:[UIColor redColor]];
        [_hSingUpBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_hSingUpBtn jk_setRoundedCorners:UIRectCornerAllCorners radius:3];
        [_hSingUpBtn jk_addActionHandler:^(NSInteger tag) {
            [weakSelf singUp];
        }];
        
    }
    return _hSingUpBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
