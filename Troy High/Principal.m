//
//  Principal.m
//  Troy HS
//
//  Created by Kyle Minshall on 3/11/14.
//
//
#import "Principal.h"

@interface Principal ()

@end

@implementation Principal

@synthesize title = title_;
@synthesize url = url_;
@synthesize message;
//@synthesize site;
//@synthesize active = indicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [active startAnimating]; //Starts the activity indicator
    
    [site setDelegate:(id)self];

    
    NSURL *siteUrl = [NSURL URLWithString:@"http://www.troyhigh.com/apps/pages/index.jsp?uREC_ID=367239&type=u"];
    NSURLRequest *request = [NSURLRequest requestWithURL:siteUrl];
    [site loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)webViewDidFinishLoad:(UIWebView *) webview //Used to check and see when to stop animating and showing the acitivity indicator spinner
{
    webview.scalesPageToFit=YES;
    
    [active stopAnimating]; //Stops it from animating
    [active removeFromSuperview];
}

@end
