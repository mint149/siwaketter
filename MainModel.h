//
//  MainModel.h
//  siwaketter
//
//  Created by 河野貴宏 on 2014/06/07.
//  Copyright (c) 2014年 Takahiro Kawano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

@property (nonatomic, retain)NSString *documentDirectory;
@property (nonatomic, retain)NSMutableArray *files;
@property (nonatomic)int fileNum;

@end
