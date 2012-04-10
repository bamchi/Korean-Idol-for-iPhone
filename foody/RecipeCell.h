//
//  RecipeCell.h
//  foody
//
//  Created by 김 경호 on 12. 4. 9..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recipe.h"

@interface RecipeCell : UITableViewCell
	
- (void)setDetailsWithRecipe:(Recipe*)recipe;
@property (weak, nonatomic) IBOutlet UILabel *dishTitle;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;
@property (weak, nonatomic) IBOutlet UILabel *twitterShareCount;

@end
