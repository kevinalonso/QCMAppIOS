//
//  Toast.m
//  QCMapp
//
//  Created by etudiant on 21/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "Toast.h"

@implementation Toast

-(void)MyToast{
NSString *message = @"You are being registered.";
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil                                                    message:message
        delegate:nil
        cancelButtonTitle:nil
        otherButtonTitles:nil, nil];
    
    toast.backgroundColor=[UIColor redColor];
    [toast show];
int duration = 2;
}

@end
