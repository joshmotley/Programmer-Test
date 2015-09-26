//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]


@interface LoginSectionViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) NSDictionary *response;
@property (weak, nonatomic) NSString *pressed;

@end

@implementation LoginSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIColor *placeholderColor = [UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1]; /*#898989*/
    
    self.usernameTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"username"
        attributes:@{NSForegroundColorAttributeName : placeholderColor,
             NSFontAttributeName : [UIFont fontWithName:@"Machinato" size:18]
             }
                                                    ];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"password"
attributes:@{NSFontAttributeName : [UIFont fontWithName:@"Machinato" size:18],
             NSForegroundColorAttributeName : placeholderColor
             }
                                                    ];
    
    self.usernameTextField.font = [UIFont fontWithName:@"Machinato" size:18];
    self.passwordTextField.font = [UIFont fontWithName:@"Machinato" size:18];
    
    
}

- (IBAction)login:(id)sender {

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"username": self.usernameTextField.text, @"password": self.passwordTextField.text};
    NSString *url = @"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php";
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        self.response = responseObject;
        NSString *code = self.response[@"code"];
        NSString *message = self.response[@"message"];
       
        if ([message isEqualToString:@"Incorrect Username or Password!"]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:code message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            alert.tag = 100;
            [alert show];}
        if (![message isEqualToString:@"Incorrect Username or Password!"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:code message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            alert.tag = 44;
            [alert show];}
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag ==44) {
        [self.navigationController popViewControllerAnimated:YES];
    }

}




@end
