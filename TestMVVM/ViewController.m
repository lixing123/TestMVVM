//
//  ViewController.m
//  TestMVVM
//
//  Created by 李 行 on 16/5/10.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"

@interface ViewController ()

@property(nonatomic)LoginViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.viewModel = [[LoginViewModel alloc] init];
    
    [self bindViewModel];
}

- (void)bindViewModel {
    @weakify(self);
    
    RAC(self.viewModel,phoneNumber) = self.phoneTextField.rac_textSignal;
    RAC(self.viewModel,password)    = self.passwordTextField.rac_textSignal;
    
    self.loginButton.rac_command          = self.viewModel.loginCommand;
    self.forgetPasswordButton.rac_command = self.viewModel.forgetPasswordCommand;
    self.registerButton.rac_command       = self.viewModel.registerCommand;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
