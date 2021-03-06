//
//  WelcomeViewController.m
//  QCMapp
//
//  Created by etudiant on 08/03/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

#import "WelcomeViewController.h"
#import "QcmWebServiceAdapter.h"
#import "DAOQcm.h"
#import "DAOQuestion.h"
#import "QuestionViewController.h"

@interface WelcomeViewController ()
{
    Qcm* qcmClick;
}

@end

@implementation WelcomeViewController
@synthesize resQcm;
@synthesize appDelegate;
@synthesize segueLogin;
@synthesize segueId;
@synthesize identityUser;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    identityUser.text = [NSString stringWithFormat:@" Bonjour %@",segueLogin];
    
    appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext* context = appDelegate.managedObjectContext;
    
    //Select all Qcm in database
    DAOQcm* daoQcm = [DAOQcm new];
    self.resQcm = [daoQcm selectAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.resQcm.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //Add elment in the field list
    cell.textLabel.text = [[self.resQcm objectAtIndex:indexPath.row]nameQcm];
    cell.textLabel.textColor = [UIColor whiteColor];
     
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Go to the question view
    QuestionViewController* questionViewController = segue.destinationViewController;
    
    //Get selected row by user
    NSManagedObject* idSelected = [self.resQcm objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    //Add element qcm selected entity Qcm
    self->qcmClick = [self.resQcm objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    //Get question to link to this Qcm
    DAOQuestion *daoQuestion = [DAOQuestion new];
    NSArray* res = [daoQuestion slectIdQcmFk:qcmClick :idSelected];
    
    //Add id Qcm to the variable in question view and the question link to this qcm
    questionViewController.idQcm = idSelected;
    questionViewController.resultQuestionFromQcm = res;
    questionViewController.idUser = [segueId integerValue];

}

@end
