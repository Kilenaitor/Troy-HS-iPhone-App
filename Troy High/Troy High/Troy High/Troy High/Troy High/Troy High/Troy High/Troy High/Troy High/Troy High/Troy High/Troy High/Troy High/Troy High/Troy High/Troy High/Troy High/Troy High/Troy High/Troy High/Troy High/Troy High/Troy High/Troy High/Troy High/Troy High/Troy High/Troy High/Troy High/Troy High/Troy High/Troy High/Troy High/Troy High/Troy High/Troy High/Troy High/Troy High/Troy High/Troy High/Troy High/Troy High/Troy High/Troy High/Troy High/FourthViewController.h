//
//  FourthViewController.h
//  Troy High
//
//  Created by Kyle Minshall on 2/25/13.
//
//

#import <UIKit/UIKit.h>

@interface FourthViewController : UIViewController
{
    IBOutlet UIView *topView;
    IBOutlet UIWebView *classesWebView;
    IBOutlet UINavigationBar *bar;
    IBOutlet UIBarButtonItem * _myButton;
    IBOutlet UIView *aView;
    IBOutlet UIActivityIndicatorView *preView;
    IBOutlet UIActivityIndicatorView *switchView;
    
}

-(IBAction)button:(id)sender;

@end
