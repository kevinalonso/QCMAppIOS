//
//  ViewController.m
//  QCMapp
//
//  Created by etudiant on 07/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "ViewController.h"
#import "QcmWebServiceAdapter.h"
#import "DAOQcm.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Récupération des élément du JSON dans ma vue
    //Alimentation des élménrt avec la méthode callback
    //Attention la méthode void ici doit toujours etre au deçus de l'appel du web service
    /*void( ^callback)(Weather*) = ^(Weather* weather){
        self.descriptionLabel.text = weather.description;
        self.idServerLabel.text = [NSString stringWithFormat:@"%d",weather.idServer];
        self.mainLabel.text = weather.main;
        
    };
    
    //Utilisation de la méthode callback
    weatherWebServiceAdapter* services = [weatherWebServiceAdapter new];
    [services getWeather:callback];*/
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendConnectionQcm:(id)sender {
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    void( ^callback)(NSArray*) = ^(NSArray* qcms){
        //Qcm* qcm =[qcms objectAtIndex:0];
        DAOQcm* daoQcm = [DAOQcm new];
        NSArray* checkQcm = [daoQcm selectAll];
        
        for (Qcm* item in qcms) {
            for (Qcm* itemSelect in checkQcm) {
                if([itemSelect.nameQcm isEqualToString:item.nameQcm]){
                    NSLog(@"Exist in database %@",itemSelect.nameQcm);
                }else{
                    [daoQcm insert:item];
                }
            }
        }
    };
    
    QcmWebServiceAdapter* services = [QcmWebServiceAdapter new];
    [services getAllQcm:callback];
}

@end
