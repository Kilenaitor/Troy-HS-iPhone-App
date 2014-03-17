//
//  SecondViewController.h
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//

#import <UIKit/UIKit.h>

@class Principal;

@interface SecondViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *cellData;
@property Principal *PrincipalView;

@end
