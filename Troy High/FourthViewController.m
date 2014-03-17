//
//  FourthViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 2/25/13.
//
//

#import "FourthViewController.h"

@interface FourthViewController ()
{
    //bool *state; //Managing the State of the UITabBarButton for the Classes/Teachers Tab
}

@end

@implementation FourthViewController
@synthesize segmentedControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    classesWebView.delegate = (id)self; //Sets the delegate to self so that it loads
        
    //state = true; //Setting inital state of the variable

    NSURL *class = [NSURL URLWithString:@"http://www.troyhigh.com/apps/classes/"]; //Setting the inital webpage to the classes page for the link
    
    NSURLRequest *classRequest = [NSURLRequest requestWithURL:class]; //Convertin the NSURL to a NSURLRequest
    
    [classesWebView loadRequest:classRequest]; //Loads the URL request
 
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentedControlIndexChanged
{
    NSURL *teachers = [NSURL URLWithString:@"http://www.troyhigh.com/apps/staff/"]; //Loads the Staff page
    NSURLRequest *teacherRequest = [NSURLRequest requestWithURL:teachers]; //Reinitiates the request
    
    NSURL *class = [NSURL URLWithString:@"http://www.troyhigh.com/apps/classes/"]; //Loads the Classes page
    NSURLRequest *classRequest = [NSURLRequest requestWithURL:class]; //Creates the request


    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            [classesWebView loadRequest:classRequest]; //Loads the request
            break;
        case 1:
            [classesWebView loadRequest:teacherRequest]; //Loads the request
            break;
        default:
            break;
    }
}

- (void)webViewDidStartLoad:(UIWebView *) webview //Checks if started load and handles the appropriate methods associated with it 
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES; //Shows activity indicator
    
    /*if(aView.alpha != 0) //Checks to see if aView is in the superview
    {
        [preView startAnimating]; //starts the animation
    }
    else
    {*/
        [switchView startAnimating]; //or determins if the other should be animating
    //}
}

- (void)webViewDidFinishLoad:(UIWebView *) webview //Checks if the webpage finished loading
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //Hides the activity indicator
    
    /*if(aView.alpha != 0) //Checks if aView is showing
    {
        [classesWebView bringSubviewToFront:classesWebView];
        [preView stopAnimating];
        [preView setOpaque:false];
        [aView setAlpha:0.0];
    }
    else
    {*/
        [switchView stopAnimating];
        [switchView setOpaque:false];
    //}
    
    webview.scalesPageToFit=YES;
}


@end
