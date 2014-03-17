//
//  SecondViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize cellData = cellData;
@synthesize PrincipalView = message;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cellData = [[NSMutableArray alloc] initWithObjects:@"Bell Schedules", @"Campus Map", @"Attendance", @"ESLRs", @"Principal's Message", @"Vision Statement", nil];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
	// Creats an array with the following entries
}

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1; //Returns the number of sections that should be in the table. We only want 1.
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return [cellData count]; //Returns the number of cells that should show in relation to the number of entries into the table
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //Sets up the table
{
    static NSString *CellIdentifier = @"Cell"; //Normal stuff for table initiation
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [cellData objectAtIndex:indexPath.row]; //Sets the title of the table cell to the name of the element in the array
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath //Checks which cell was selected and appropriately directs the user to the appropriate vew with the information that they want
{
    
    if(indexPath.row == 0) //Row that was selected
    {
        [self performSegueWithIdentifier:@"Bell" sender:nil]; //Segue call
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES]; //Transition
    }
    
    if(indexPath.row == 1)
    {
        [self performSegueWithIdentifier:@"Map" sender:nil];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
    
    if(indexPath.row == 2)
    {
        [self performSegueWithIdentifier:@"Attendence" sender:nil];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
    
    if(indexPath.row == 3)
    {
        [self performSegueWithIdentifier:@"ESLR" sender:nil];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
    
    if(indexPath.row == 4)
    {
        [self performSegueWithIdentifier:@"Principal" sender:nil];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
    
    if(indexPath.row == 5)
    {
        [self performSegueWithIdentifier:@"Vision" sender:nil];
        [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
