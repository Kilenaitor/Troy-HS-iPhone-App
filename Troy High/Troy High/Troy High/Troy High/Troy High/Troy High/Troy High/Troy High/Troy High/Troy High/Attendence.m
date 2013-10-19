//
//  Attendence.m
//  Troy High
//
//  Created by Kyle Minshall on 3/13/13.
//
//

#import "Attendence.h"

@implementation Attendence

@synthesize webView;

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Attendence" ofType:@"pdf"]; //Initializes the PDF from the bundled information
    NSURL *url = [NSURL fileURLWithPath:path]; //Creates the URL
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //Changes the URL to a web request
    [webView loadRequest:request]; //Asks the webView to load the request (which is the PDF. It's just easier to load it like this)
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
}


@end
