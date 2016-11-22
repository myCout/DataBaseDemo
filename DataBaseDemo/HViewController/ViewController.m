//
//  ViewController.m
//  DataBaseDemo
//
//  Created by HY on 2016/11/16.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "ViewController.h"
#import "HSignUpVC.h"


@interface ViewController ()
@property (nonatomic, retain)  UITextField *hAccountTextField;
@property (nonatomic, retain)  UITextField *hPasswordTextField;

@property (nonatomic, retain)  UIButton *hLoginBtn;
@property (nonatomic, retain)  UIButton *hSingUpBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self UIInit];
}

- (void)UIInit{
    
    [self.view addSubview:self.hAccountTextField];
    [self.view addSubview:self.hPasswordTextField];
    [self.view addSubview:self.hLoginBtn];
    [self.view addSubview:self.hSingUpBtn];
}

#pragma mark - Action

- (void)logIn{
    [self.hLoginBtn jk_showIndicator];
    HPersonModel *model = [HPersonModel new];
    model.account = self.hAccountTextField.text;
    int randomx = arc4random() % 10;
    model.name = [NSString stringWithFormat:@"aliluya%d",randomx];
    model.passWord = self.hPasswordTextField.text;
    
    /** 查询单条记录 */
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       HPersonModel *newModel = [HPersonModel findFirstByCriteria:[NSString stringWithFormat:@" WHERE pk = '%d' ",3]];//aliluya6
        newModel.sex = @"mana";
        newModel.age = @"18";
        [newModel saveOrUpdate];
        [self.hLoginBtn jk_hideIndicator];
        [HUserDefault setBool:YES forKey:@"LogIn"];
        [HUserDefault synchronize];
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] initRootVC];
    });
}

#pragma mark - Get/Set
//-(UIImageView *)hEmailImgView{
//    if (_hEmailImgView == nil) {
//        _hEmailImgView = [[UIImageView alloc] initWithFrame:CGRectMake(isIPad?40:20,13, 16, 14)];
//        _hEmailImgView.image = [UIImage imageNamed:@"icon_login_mail"];
//    }
//    return _hEmailImgView;
//}

- (UITextField *)hAccountTextField
{
    if (_hAccountTextField == nil) {
        _hAccountTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 40, self.view.width-15*2, 40)];
//        _hAccountTextField.delegate = self;
        _hAccountTextField.borderStyle = UITextBorderStyleRoundedRect;
        _hAccountTextField.placeholder = @"账号";
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

- (UIButton *)hLoginBtn{
    if(!_hLoginBtn){
        WS(weakSelf)
        _hLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.hPasswordTextField.bottom+20, self.hPasswordTextField.width, 44)];
        [_hLoginBtn setBackgroundColor:[UIColor blueColor]];
        [_hLoginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_hLoginBtn jk_setRoundedCorners:UIRectCornerAllCorners radius:3];
        [_hLoginBtn jk_addActionHandler:^(NSInteger tag) {
//            NSLog(@"登录");
            [weakSelf logIn];
        }];
    }
    return _hLoginBtn;
}

- (UIButton *)hSingUpBtn{
    if(!_hSingUpBtn){
        WS(weakSelf)
        _hSingUpBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.hLoginBtn.bottom+20, self.hPasswordTextField.width, 44)];
        [_hSingUpBtn setBackgroundColor:[UIColor redColor]];
        [_hSingUpBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_hSingUpBtn jk_setRoundedCorners:UIRectCornerAllCorners radius:3];
        [_hSingUpBtn jk_addActionHandler:^(NSInteger tag) {
            NSLog(@"注册");
            HSignUpVC *hSignUpVC = [HSignUpVC new];
            [weakSelf.navigationController pushViewController:hSignUpVC animated:YES];
        }];
    }
    return _hSingUpBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
