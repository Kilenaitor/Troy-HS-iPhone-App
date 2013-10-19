//
//  NewsViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 3/4/13.
//
//

#import "NewsViewController.h"
#import "RSSEntry.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

@synthesize allEntries = _allEntries;

- (void)addRows {
    RSSEntry *entry1 = [[RSSEntry alloc] initWithBlogTitle:@"1"
                                               articleTitle:@"1"
                                                 articleUrl:@"1"
                                                articleDate:[NSDate date]];
    RSSEntry *entry2 = [[RSSEntry alloc] initWithBlogTitle:@"2"
                                               articleTitle:@"2"
                                                 articleUrl:@"2"
                                                articleDate:[NSDate date]];
    RSSEntry *entry3 = [[RSSEntry alloc] initWithBlogTitle:@"3"
                                               articleTitle:@"3"
                                                 articleUrl:@"3"
                                                articleDate:[NSDate date]];
    
    [_allEntries insertObject:entry1 atIndex:0];
    [_allEntries insertObject:entry2 atIndex:0];
    [_allEntries insertObject:entry3 atIndex:0];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.title = @"Feeds";
    self.allEntries = [NSMutableArray array];
    [self addRows];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
