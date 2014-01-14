//
//  MovieDetailsViewController.m
//  rottentomatoes1
//
//  Created by Sandip Patel on 1/11/14.
//  Copyright (c) 2014 Y.CORP.YAHOO.COM\cmaheta84. All rights reserved.
//

#import "MovieDetailsViewController.h"

@interface MovieDetailsViewController ()

@end

@implementation MovieDetailsViewController

@synthesize movie;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [self.movie objectForKey:@"title"];
    //self.titleLabel.text = [self.movie objectForKey:@"title"];
    
    //self.ratingsLabel.text = [self.movie objectForKey:@"mpaa_rating"];
    //self.sysLabel.text = [self.movie objectForKey:@"synopsis"];
    //NSArray *cast = [NSArray array];
    //cast = [self.movie objectForKey:@"abridged_cast"];
    //for(int index = 0; index <cast.count;index++) {
      //  NSDictionary *actors = [cast objectAtIndex:index];
        //self.actorsLabel.text = [actors objectForKey:@"name"];
    //}
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell != nil) {
        // This assumes that you set the tag to 1 on the label
        UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
        titleLabel.text = [self.movie objectForKey:@"title"];
        
        UILabel *ratingsLabel = (UILabel *)[cell viewWithTag:102];
        ratingsLabel.text = [self.movie objectForKey:@"mpaa_rating"];
        
        UILabel *sysLabel = (UILabel *)[cell viewWithTag:104];
        sysLabel.text = [self.movie objectForKey:@"synopsis"];
        
        NSString *actorsText = @" ";
        NSArray *cast = [NSArray array];
        cast = [self.movie objectForKey:@"abridged_cast"];
        for(int index = 0; index <cast.count;index++) {
          NSDictionary *actors = [cast objectAtIndex:index];
        actorsText = [actorsText stringByAppendingString:[actors objectForKey:@"name"]];
        }
        
        UILabel *actorLabel = (UILabel *)[cell viewWithTag:103];
        actorLabel.text = actorsText;
        
        NSDictionary *posters = [self.movie objectForKey:@"posters"];
        NSString *path = [posters objectForKey:@"profile"];
        UIImageView *posterView = (UIImageView *)[cell viewWithTag:105];
        posterView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
    }
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
