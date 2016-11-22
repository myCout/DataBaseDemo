//
//  HPersonModel.h
//  DataBaseDemo
//
//  Created by HY on 2016/11/16.
//  Copyright © 2016年 HY. All rights reserved.
//

#import "JKDBModel.h"
#import "JKDBHelper.h"
@interface HPersonModel : JKDBModel

/** 账号 */
@property (nonatomic, copy)     NSString                    *account;
/** 名字 */
@property (nonatomic, copy)     NSString                    *name;
/** 密码 */
@property (nonatomic, copy)     NSString                    *passWord;
/** 性别 */
@property (nonatomic, copy)     NSString                    *sex;

@property (nonatomic, copy)     NSString                    *age;
@end
