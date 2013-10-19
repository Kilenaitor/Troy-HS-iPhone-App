//
//  FirstViewController.m
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//  Consulted tutorial by Jason Terhost from www.gigaom.com "How to build an RSS reader for iPhone"
//  Tutorial adapted for iOS 6.1 enviornment. API and source code was slightly adjusted. 
//

#import "FirstViewController.h" //Class import lists
#import "AnnouncementView.h" //Sub class used for viewing the UIWebLinks

//#import "Reachability.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize AnnouncementView = _AnnouncementView;
@synthesize articleUrl = _articleUrl;
@synthesize storyLink;

- (void)viewDidLoad
{
    [super viewDidLoad]; //necessary
    
    /*[[UINavigationBar appearanceWhenContainedIn:[UIViewController class], nil]
     setTintColor: [UIColor colorWithRed:0.7 green:0.0 blue:0.0 alpha:1.0]];*/
    
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundColor:[UIColor colorWithRed:0.7 green:0.0 blue:0.0 alpha:1.0]];
    
    [myNews setDelegate:self]; //This is required for delegate methods
    
    if([stories count] == 0)
    {
        NSString * path = @"http://troyhigh.com/apps/news/news_rss.jsp?id=0"; //Source of RSS feed
        [self parseXMLFileAtURL: path]; //call the parse command
    }
    
    [aView removeFromSuperview]; //Removes the loader
    [activityIndicator stopAnimating]; //Stops the animating spinner
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO; //stops the spinner
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section //Declares the number of rows that should appear onto the table
{
    return [stories count]; //Counts the stories
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath //Calls the action when you press on a cell in the table
{
    
	int storyIndex = [indexPath indexAtPosition: [indexPath length] - 1]; //Creates a storyIndex variable to hold the current cell index
    
	storyLink = [[stories objectAtIndex: storyIndex] objectForKey: @"link"]; //String that will hold the Link from that particular XML entry
    
    
	// clean up the link - get rid of spaces, returns, and tabs...
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@" " withString:@""]; //Removes tabs and spaces from the code
	storyLink = [storyLink stringByReplacingOccurrencesOfString:@"	" withString:@""]; //""
    
    [self performSegueWithIdentifier:@"AnnouncementView" sender: storyLink]; //Set's segue to self
    
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES]; //Sends the request over to AnnouncementView so that it knows to output the website link
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender //used for sending and modifying variables and data across StoryBoards
{
    if ([[segue identifier] isEqualToString:@"AnnouncementView"]) //the identifier is used so that it links to the correct storyboard
    {
        AnnouncementView *myVC = [segue destinationViewController]; //AnnouncementView is the class that we will be linking to. The segue is just a fancy name for connection.
        
        
        myVC.request = storyLink; //Sends the storyLink data to the AnnouncementView class so that it can be referenced and called
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath //Basically just returns and popululates all of the cells in the application
{
	static NSString *MyIdentifier = @"MyIdentifier"; //Just an easy way to to identify the identifier
    
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier]; //Initializes the UITable
    
	if (cell == nil)
    {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier]; //Can't be null (nil in Objective-C) so it has to verify that there is SOME data
	}

	// Set up the cell
    
    cell.textLabel.numberOfLines = 3;
    
	int storyIndex = [indexPath indexAtPosition: indexPath.length -1]; //Index of the cell you are at
    
	cell.textLabel.text = [[stories objectAtIndex: storyIndex] objectForKey: @"title"]; //Set the cell title to the article title
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [[stories objectAtIndex: storyIndex] objectForKey: @"date"]]; //Set the subtitle to the current date
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //Shows the little arrow on the edge of the cell
    
    
	return cell; //returns the cell back to the UITable so that it can be seen in the GUI
}

- (void)didReceiveMemoryWarning //All this does is check to make sure you aren't out of RAM and that you aren't leaking anything. Woop di doo. 
{
    [super didReceiveMemoryWarning];
    self.AnnouncementView = nil;
    // Dispose of any resources that can be recreated.
}

 - (void)parseXMLFileAtURL:(NSString *)URL //Parses an XML that is supplied by the Troy website to their RSS reader
{
     stories = [[NSMutableArray alloc] init]; //Initialize the array
    
    [myNews addSubview:aView]; //Adds the Loading view as a subview
    [activityIndicator startAnimating]; //Animates the activity indicator 
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES; //Shows the network activity indicator
     
     //you must then convert the path to a proper NSURL or it won't work
     NSURL *xmlURL = [NSURL URLWithString:URL];
     
     // here, for some reason you have to use NSClassFromString when trying to alloc NSXMLParser, otherwise you will get an object not found error
     // this may be necessary only for the toolchain
     rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    
     // Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
     [rssParser setDelegate:(id)self];
     
     // Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
     [rssParser setShouldProcessNamespaces:NO];
     [rssParser setShouldReportNamespacePrefixes:NO];
     [rssParser setShouldResolveExternalEntities:NO];
     [rssParser parse];
 }

- (void)parserDidStartDocument:(NSXMLParser *)parser  //Development tool to verify that the app is INDEEED processing the XML
{
    NSLog(@"Found File and Started Parsing"); //Helpful for debugging
}

-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError //Error console addition 
{
    NSString * errorString = [NSString stringWithFormat:@"An Internet Connection is Required"]; //Error output if an internet connection is not detected
    NSLog(@"Error parsing XML: %@", errorString); //Error if the XML file is awkard or corrupt
    
    UIAlertView * errorAlert = [[UIAlertView alloc] initWithTitle:@"Note" message:errorString delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]; //Generates the error
    
    [aView removeFromSuperview]; //Removes the layer from the view
    [activityIndicator stopAnimating]; //Stops it from spinning

    [errorAlert show]; //Shows the error
    
}

- (void)parser: (NSXMLParser *)parser didStartElement:(NSString *)elementName //the ACTUAL parser that will be doing a lot of the work. This was borrowed for the project. 
                                         namespaceURI:(NSString *)namespaceURI
                                        qualifiedName:(NSString*)qName
                                           attributes:(NSDictionary *)attributeDict
{
    currentElement = [elementName copy];
    
    if([elementName isEqualToString:@"item"])
    {
        //clear out story item caches
        item = [[NSMutableDictionary alloc] init];
        currentTitle = [[NSMutableString alloc] init];
        currentDate = [[NSMutableString alloc] init];
        currentSummary = [[NSMutableString alloc] init];
        currentLink = [[NSMutableString alloc ] init];
    }
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
	
    NSLog(@"ended element: %@", elementName);
	if ([elementName isEqualToString:@"item"])
    {
		// save values to an item, then store that item into the array...
		[item setObject:currentTitle forKey:@"title"];
		[item setObject:currentLink forKey:@"link"];
		[item setObject:currentSummary forKey:@"summary"];
		[item setObject:currentDate forKey:@"date"];
        
		[stories addObject:[item copy]];
		NSLog(@"adding story: %@", currentTitle);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
	NSLog(@"found characters: %@", string);
	// save the characters for the current item...
	if ([currentElement isEqualToString:@"title"])
    {
		[currentTitle appendString:string];
	}
    else if ([currentElement isEqualToString:@"link"])
    {
		[currentLink appendString:string];
	}
    else if ([currentElement isEqualToString:@"description"])
    {
		[currentSummary appendString:string];
	}
    else if ([currentElement isEqualToString:@"pubDate"])
    {
		[currentDate appendString:string];
	}
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
	[aView removeFromSuperview]; //Remove the loader
    [activityIndicator stopAnimating]; //Stop it from animating
    
	NSLog(@"stories array has %d items", [stories count]); //Outputs the number of elements in the Array (will always be 10 because of Troy's website)
    [myNews reloadData]; //Loads the table content
}

@end


