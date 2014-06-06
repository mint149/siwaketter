//
//  MainModel.m
//  siwaketter
//
//  Created by 河野貴宏 on 2014/06/07.
//  Copyright (c) 2014年 Takahiro Kawano. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel

@synthesize documentDirectory;
@synthesize files;
@synthesize fileNum;

-(id)init{
	if(self = [super init]){
		//Documents内のファイルリストを表示
		// ドキュメントディレクトリ
		NSArray *documentDirectries = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		documentDirectory = [documentDirectries lastObject];
		NSLog(@"%@",documentDirectory);
		
		// ドキュメントディレクトリにあるファイルリスト
		NSError *error = nil;
		NSFileManager *fileManager = [NSFileManager defaultManager];
		files = (NSMutableArray*)[fileManager contentsOfDirectoryAtPath:documentDirectory error:&error];
		for (NSString *file in files) {
			NSLog(@"%@", file);
		}
		
		//DS_Storeを飛ばすために1とする
		fileNum = 1;
	}
	return self;
}

@end
