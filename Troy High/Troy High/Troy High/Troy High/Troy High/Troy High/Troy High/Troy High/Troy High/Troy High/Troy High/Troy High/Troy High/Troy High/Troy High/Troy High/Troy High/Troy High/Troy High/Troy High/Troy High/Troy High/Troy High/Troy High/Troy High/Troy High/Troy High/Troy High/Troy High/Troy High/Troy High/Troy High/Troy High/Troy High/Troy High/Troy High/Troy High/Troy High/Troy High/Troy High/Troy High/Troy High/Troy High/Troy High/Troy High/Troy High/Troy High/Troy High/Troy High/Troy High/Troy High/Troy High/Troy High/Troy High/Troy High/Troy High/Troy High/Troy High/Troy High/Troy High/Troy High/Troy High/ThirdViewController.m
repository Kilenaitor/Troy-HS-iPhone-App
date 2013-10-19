//
//  FirstViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [myWebView addSubview:loadView]; //Adds the webview to the subview
    [indicator startAnimating]; //Starts the activity indicator
    
    [myWebView setDelegate:(id)self];
    
    NSURL *url = [NSURL URLWithString:@"https://mystudent.fjuhsd.net/loginhome.asp"]; //Loads the Aeries website
    
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
    [loadView removeFromSuperview]; //Removes the loadView from superview
    [indicator stopAnimating]; //Stops it from animating
}

@end
