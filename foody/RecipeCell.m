//
//  RecipeCell.m
//  foody
//
//  Created by 김 경호 on 12. 4. 9..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "RecipeCell.h"

@implementation RecipeCell
@synthesize dishTitle;
@synthesize dishImageView;
@synthesize twitterShareCount;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    // Initialization code
  }
  return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

- (void)setDetailsWithRecipe:(Recipe*)recipe
{
  dishTitle.text = recipe.name;
  
  twitterShareCount.text = [NSString stringWithFormat:@"%d", 0];
  
  
//  UIImage *image = nil;
//  
//  if (recipe.imageData) {
//    image = [UIImage imageWithData:recipe.thumbImageData];
//  } else {
//    [recipe loadData];
//    image = [UIImage imageWithData:recipe.thumbImageData];
//  }   
//  
//  if(image) 
//  {
//    dishImageView.image = image;        
//  }
}

@end
