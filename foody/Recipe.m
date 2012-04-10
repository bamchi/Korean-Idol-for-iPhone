//
//  Recipe.m
//  foody
//
//  Created by 김 경호 on 12. 4. 10..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

@synthesize recipe_id;
@synthesize name;
@synthesize body;
@synthesize imageUrl;
@synthesize thumbNail;
@synthesize twitterShareCount;

@synthesize thumbImageData;
@synthesize imageData;

- (void)loadData 
{
    NSURL *thumbUrl = [NSURL URLWithString:self.thumbNail];
    self.thumbImageData = [NSData dataWithContentsOfURL:thumbUrl];

    NSURL *tempImageUrl = [NSURL URLWithString:self.imageUrl];
    self.imageData = [NSData dataWithContentsOfURL:tempImageUrl];
}

@end

