//
//  LunchView.m
//  Troy High
//
//  Created by Kyle Minshall on 3/13/13.
//
//

#import "LunchView.h"

@interface LunchView ()

@end

@implementation LunchView

@synthesize webView;
@synthesize indicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	NSURL *food = [NSURL URLWithString:@"http://troyhigh.com/apps/food_menu/"]; //Calls to the website
    
    NSURLRequest *foodRequest = [NSURLRequest requestWithURL:food]; //Convertin the NSURL to a NSURLRequest
    
    [webView setDelegate:(id)self]; //Sets the delegate to self so that the DidStartLoad and DidFinishLoad methods get called
    
    [webView loadRequest:foodRequest]; //Calls for the request
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *) webview
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *) webview
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [indicator stopAnimating];
    [indicator setOpaque:false];
}


@end
