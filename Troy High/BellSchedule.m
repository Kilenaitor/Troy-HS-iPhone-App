//
//  BellSchedule.m
//  Troy High
//
//  Created by Kyle Minshall on 3/11/13.
//
//

#import "BellSchedule.h"

@interface BellSchedule ()

@end

@implementation BellSchedule

@synthesize webView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BellsN" ofType:@"pdf"]; //Loads the PDf for the bell schedule
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
