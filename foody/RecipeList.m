//
//  RecipeList.m
//  foody
//
//  Created by 김 경호 on 12. 4. 9..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "RecipeList.h"
#import "RecipeCell.h"
#import "RecipeDetail.h"
//#import "JSON/JSON.h"
#import "JSON-Url/myJson.h"
#import "Recipe.h"

@interface RecipeList ()

@end

@implementation RecipeList

@synthesize recipes;

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
    self.title = @"Dishes";
    
    [self loadRecipes];
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    RecipeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"RecipeCell" owner:self options:nil];
        
        for(id currentObject in objects)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]]) 
            {
                cell = (RecipeCell *)currentObject;
                break;
            }
        }
    }
    
    Recipe *recipe = [recipes objectAtIndex:indexPath.row];
    [cell setDetailsWithRecipe:recipe];
    
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecipeDetail *recipeDetail = [[RecipeDetail alloc] initWithNibName:@"RecipeDetail" bundle:nil];
    
    recipeDetail.recipe = [recipes objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:recipeDetail animated:TRUE];
}

- (void)loadRecipes
{
    NSString *url = @"http://korean-idol.heroku.com/photos.json";
    
    Json *myJsonParser = [[Json alloc] init];
    
    [myJsonParser startLoadingObjectWithUrl:url andDelegate:self];
}

-(void)dataRequestCompletedWithJsonObject:(id)jsonObject 
{
    NSArray *array = (NSArray*)jsonObject;
    
    self.recipes = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in array) {
        Recipe *recipe = [[Recipe alloc] init];
        recipe.recipe_id = [[dic objectForKey:@"id"] intValue]; 
        recipe.name = [dic objectForKey:@"title"];
        recipe.body = [dic objectForKey:@"body"];

        NSString *filename = [dic objectForKey:@"image_file_name"];
        recipe.thumbNail = [NSString stringWithFormat:@"http://korean-idol-pro.s3.amazonaws.com/thumb/%d/%@", recipe.recipe_id, filename];
        recipe.imageUrl = [NSString stringWithFormat:@"http://korean-idol-pro.s3.amazonaws.com/original/%d/%@", recipe.recipe_id, filename];
        
        [recipes addObject:recipe];
    }
    
    [self.tableView reloadData];
    
}


@end
