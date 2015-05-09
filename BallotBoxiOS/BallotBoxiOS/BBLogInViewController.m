//
//  BBLogInViewController.m
//  BallotBoxiOS
//
//  Created by james grippo on 5/3/15.
//  Copyright (c) 2015 james grippo. All rights reserved.
//

#import "BBLogInViewController.h"
#import "BBManager.h"
#import "Masonry.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@interface BBLogInViewController ()
{
    UITextField* username;
    UITextField* password;
    UIButton* LogIn;
    NSString* accessToken;
}

@end

@implementation BBLogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (instancetype)init
{
    self = [super init];
    
    username = [[UITextField alloc] init];
    [self.view addSubview:username];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 10, 0, 10);

    
    [username mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view.mas_centerX);
         make.centerY.equalTo(self.view.mas_centerY).with.offset(-22);
         make.left.equalTo(self.view.mas_left).with.offset(padding.left);
         make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
     }];
    
    password = [[UITextField alloc] init];
    [self.view addSubview:password];
    
    [password mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view.mas_centerX);
         make.centerY.equalTo(self.view.mas_centerY).with.offset(22);
         make.left.equalTo(self.view.mas_left).with.offset(padding.left);
         make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
     }];
    
    LogIn = [[UIButton alloc] init];
    [self.view addSubview:LogIn];
    
    [LogIn mas_makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view.mas_centerX);
         make.centerY.equalTo(self.view.mas_centerY).with.offset(66);
         make.left.equalTo(self.view.mas_centerX).with.offset(padding.left);
         make.right.equalTo(self.view.mas_right).with.offset(-padding.right);
     }];
    
    [LogIn setTitle:@"Log In!" forState:UIControlStateNormal];
    [LogIn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [LogIn addTarget:self action:@selector(logInButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    username.placeholder = @"Username";
    password.placeholder = @"Password";
    
    
    
    return self;
}

- (void) logInButtonPressed
{
    [self sendRequest:@""];
}

- (void) sendRequest : (NSString*) action
{
    NSDictionary* POSTdictionary = @{@"client_id":[[BBManager manager] getApplicationID], @"client_secret":[[BBManager manager] getSecret], @"username":username.text, @"password":password.text, @"grant_type":@"password"};
    
    [[BBManager sessionManager] POST:@"/oauth/token" parameters:POSTdictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [[[BBManager sessionManager] requestSerializer] setValue:[NSString stringWithFormat:@"Bearer %@", responseObject[@"access_token"]] forHTTPHeaderField:@"Authorization"];
        [[BBManager manager] setAccessToken:responseObject[@"access_token"]];
        [(AppDelegate*)[[UIApplication sharedApplication] delegate] completeLogIn];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"WOW IT FAILED: %@", [error description]);
    } ];
    
    
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
