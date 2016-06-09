//
//  AlertInfo.m
//  QCMapp
//
//  Created by etudiant on 09/06/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "AlertInfo.h"
#import "Constant.h"

@implementation AlertInfo

-(void)alerMessage:(UIViewController*) uiViewController:(NSString*)messageString{
    Constant* constant = [Constant new];
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:constant.MESSAGE_ALERT_INFO
                                                                    message:messageString
                                                             preferredStyle:UIAlertControllerStyleAlert];
    
    [uiViewController presentViewController:alert animated:YES completion:nil];
    //[self presentViewController:alert animated:YES completion:nil];
    //Alert for the user (Toast message)
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action){
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    [alert addAction:ok];
}

@end
