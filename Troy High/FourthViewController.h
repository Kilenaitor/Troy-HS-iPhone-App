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
    IBOutlet UIWebView *classesWebView;
    IBOutlet UIActivityIndicatorView *switchView;
}
@property (nonatomic,retain) IBOutlet UISegmentedControl *segmentedControl;

-(IBAction) segmentedControlIndexChanged;

@end
