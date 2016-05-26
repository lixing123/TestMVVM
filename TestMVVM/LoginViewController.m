//
//  LoginViewController.m
//  TestMVVM
//
//  Created by 行 李 on 16/5/25.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "LoginViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"

@interface LoginViewController ()

@property(nonatomic)LoginViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.viewModel = [[LoginViewModel alloc] init];
    
    [self bindViewModel];
}

- (void)bindViewModel {
    @weakify(self)
    
    //view->viewModel
    RAC(self.viewModel,phoneNumber) = self.phoneTextField.rac_textSignal;
    RAC(self.viewModel,password)    = self.passwordTextField.rac_textSignal;
    
    //viewModel->view
    RAC(self.alertLabel,text) = RACObserve(self.viewModel, loginResultString);
    
    //action
    self.loginButton.rac_command          = self.viewModel.loginCommand;
    self.forgetPasswordButton.rac_command = self.viewModel.forgetPasswordCommand;
    self.registerButton.rac_command       = self.viewModel.registerCommand;    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
