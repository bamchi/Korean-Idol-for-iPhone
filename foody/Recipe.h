//
//  Recipe.h
//  foody
//
//  Created by 김 경호 on 12. 4. 10..
//  Copyright (c) 2012년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, assign) int recipe_id;
@property (nonatomic, copy) NSString *name; // retain -> copy
@property (nonatomic, copy) NSString *body; // retain -> copy
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *thumbNail;
@property (nonatomic, assign) int twitterShareCount;

@property (nonatomic, retain) NSData *thumbImageData;
@property (nonatomic, retain) NSData *imageData;

- (void)loadData;

@end
