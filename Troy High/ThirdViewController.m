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
    
    [indicator startAnimating]; //Starts the activity indicator
    
    [myWebView setDelegate:(id)self];
    
    NSURL *url = [NSURL URLWithString:@"https://mystudent.fjuhsd.net/Parent/LoginParent.aspx?page=default.aspx"]; //Loads the Aeries website
    
    NSURLRequest *myRequest = [NSURLRequest requestWithURL:url]; //Converts to URL request
    
    [myWebView loadRequest:myRequest]; //Calls for the request
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void) webViewDidFinishLoad:(UIWebView *) webView
{
    [indicator stopAnimating]; //Stops it from animating
    [indicator removeFromSuperview];

    myWebView.scrollView.scrollEnabled = YES;
    
    webView.scalesPageToFit=YES;
}

@end
