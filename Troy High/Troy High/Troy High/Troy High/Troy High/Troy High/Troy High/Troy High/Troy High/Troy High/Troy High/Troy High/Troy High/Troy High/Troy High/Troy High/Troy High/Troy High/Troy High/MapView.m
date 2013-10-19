//
//  MapView.m
//  Troy High
//
//  Created by Kyle Minshall on 3/13/13.
//
//

#import "MapView.h"

@interface MapView ()

@end

@implementation MapView

@synthesize webView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"pdf"]; //Loads the PDF
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
