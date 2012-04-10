//
//  RecipeList.h
//  foody
//
//  Created by 김 경호 on 12. 4. 9..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON-Url/myJson.h"

@interface RecipeList : UITableViewController <myJsonDelegate>

@property (nonatomic, retain) NSMutableArray *recipes;
@property (nonatomic, assign) int page;

- (void)loadRecipes;
- (void)processLoadRecipes; // :(NSString *)name;

@end
