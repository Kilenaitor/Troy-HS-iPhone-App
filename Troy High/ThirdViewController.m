//
//  FirstViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//

#import "ThirdViewController.h"
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [myWebView addSubview:loadView]; //Adds the webview to the subview
    [indicator startAnimating]; //Starts the activity indicator
    
    [myWebView setDelegate:(id)self];
    
    NSURL *url = [NSURL URLWithString:@"https://mystudent.fjuhsd.net/Parent/m/parents#/"]; //Loads the Aeries website
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:url]; //Converts to URL request
    
    [myWebView loadRequest:myRequest]; //Calls for the request
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) webViewDidFinishLoad:(UIWebView *) webView
{
    [indicator stopAnimating]; //Stops it from animating
    [indicator removeFromSuperview];
    
    if (!SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        myWebView.scrollView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
    myWebView.scrollView.scrollEnabled = NO;
}

@end
