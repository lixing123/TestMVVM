//
//  LoginViewModel.h
//  TestMVVM
//
//  Created by 李 行 on 16/5/12.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface LoginViewModel : NSObject

//viewController->viewModel
@property(nonatomic)NSString *phoneNumber;
@property(nonatomic)NSString *password;

//viewModel->viewController
@property(nonatomic)

//action
@property(nonatomic)RACCommand *loginCommand;
@property(nonatomic)RACCommand *registerCommand;
@property(nonatomic)RACCommand *forgetPasswordCommand;

@end
