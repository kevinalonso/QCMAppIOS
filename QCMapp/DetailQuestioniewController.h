//
//  DetailQuestioniewController.h
//  QCMapp
//
//  Created by etudiant on 19/04/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Qcm.h"

@interface DetailQuestioniewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *questionTitle;
@property int idQcm;
@property Qcm* qcm;
@property NSString* test;


@end
