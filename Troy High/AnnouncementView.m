//
//  AnnouncementView.m
//  Troy High
//
//  Created by Kyle Minshall on 2/27/13.
//
//

#import "AnnouncementView.h"
#import "FirstViewController.h"

@interface AnnouncementView ()

@end

@implementation AnnouncementView

@synthesize webView = myWebView;  //@synthesize just "initializes" the variables so they are usable
@synthesize entry = _entry;
@synthesize request;
@synthesize active = indicator;

@synthesize title = title_;
@synthesize url = url_;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSRange match;
    match = [request rangeOfString: @"pdf"];
    
    NSURL *url;
    
    if(match.location == NSNotFound)
    {
        url = [NSURL URLWithString:[request stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding]]; //Setting thewebpage to the classes page for the link
    }
    else
    {
        url = [NSURL URLWithString:request]; //Setting the  webpage to the classes page for the link
    }

    NSURLRequest *classRequest = [NSURLRequest requestWithURL:url]; //Convertin the NSURL to a NSURLRequest
    
    [myWebView loadRequest:classRequest]; //Calling the request for the WebKit to load the NSURL
    
    NSLog(@"Requested Link: %@", classRequest);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *) webview //Used to check and see if the activity indicator should be spinning
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *) webview //Used to check and see when to stop animating and showing the acitivity indicator spinner
{
    webview.scalesPageToFit=YES;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [indicator stopAnimating];
    [indicator setOpaque:false];
    [indicator removeFromSuperview];
}



@end
