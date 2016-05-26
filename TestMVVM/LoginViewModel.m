//
//  LoginViewModel.m
//  TestMVVM
//
//  Created by 李 行 on 16/5/12.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    
    return self;
}

- (void)initialize {
//    RACSignal *validSearchSignal =
//    [[RACObserve(self, searchText)
//      map:^id(NSString *text) {
//          return @(text.length > 3);
//      }]
//     distinctUntilChanged];
//    
//    [validSearchSignal subscribeNext:^(id x) {
//        NSLog(@"search text is valid %@", x);
//    }];
    
    RACSignal *phoneNumberValidSignal = [RACObserve(self, phoneNumber) map:^id(NSString *text) {
        return @(text.length==11);
    }];
    
    RACSignal *passwordValidSignal = [RACObserve(self, password) map:^id(NSString *text) {
        return @(text.length>=6);
    }];
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        
    }];
}

@end
