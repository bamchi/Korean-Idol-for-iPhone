//
//  RecipeDetail.m
//  foody
//
//  Created by 김 경호 on 12. 4. 10..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "RecipeDetail.h"

@interface RecipeDetail ()

@end

@implementation RecipeDetail
@synthesize dishBody;
@synthesize scrollView;
@synthesize dishImage;
@synthesize dishTitle;
@synthesize recipe;

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
    scrollView.contentSize = CGSizeMake(320, 520);
    
    UIImage *backgroundImage = [UIImage imageNamed:@"leather-background.png"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    
    [self.view setBackgroundColor:backgroundPattern];
    
    dishImage.image = [UIImage imageWithData:recipe.imageData];
    dishTitle.text = recipe.name;
    dishBody.text = recipe.body;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setDishImage:nil];
    [self setDishTitle:nil];
    [self setDishBody:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
