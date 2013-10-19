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

@synthesize webView = _webView;  //@synthesize just "initializes" the variables so they are usable
@synthesize entry = _entry;
@synthesize request;
@synthesize active = indicator;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    
    NSURL *class = [NSURL URLWithString:request]; //Setting the inital webpage to the classes page for the link
    
    NSURLRequest *classRequest = [NSURLRequest requestWithURL:class]; //Convertin the NSURL to a NSURLRequest
    
    [_webView loadRequest: classRequest]; //Calling the request for the WebKit to load the NSURL
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
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [indicator stopAnimating];
    [indicator setOpaque:false];
}



@end
