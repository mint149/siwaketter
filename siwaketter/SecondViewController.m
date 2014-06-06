//
//  SecondViewController.m
//  siwaketter
//
//  Created by 河野貴宏 on 2014/06/06.
//  Copyright (c) 2014年 Takahiro Kawano. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
- (IBAction)documentsFilesRestore:(id)sender;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	// プロパティへのアクセスのためにインスタンス生成
	model = [MainModel new];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)documentsFilesRestore:(id)sender {
	// ファイルマネージャを作成
//	NSFileManager *fileManager = [NSFileManager defaultManager];
//	
//	// srcをdstに変更する
//	NSString *src = [documentDirectory stringByAppendingPathComponent:files[fileNum]];
//	NSString *dstDir = [documentDirectory stringByAppendingPathComponent:@"sample-dir2"];
//	NSString *dst = [dstDir stringByAppendingPathComponent:files[fileNum]];
//	
//	NSError *error;
//	
//	// 文字列型の変数 path で指定したファイルまたはディレクトリが存在するかを調べます。
//	if (![fileManager fileExistsAtPath:dstDir])
//	{
//		[fileManager createDirectoryAtPath:dstDir withIntermediateDirectories:YES attributes:nil error:&error];
//		
//	}
//	
//	// ファイルを移動
//	BOOL result = [fileManager copyItemAtPath:src toPath:dst error:&error];
//	if (result) {
//		[files removeObjectAtIndex:fileNum];
//		NSLog(@"バックアップ復元：%@", dst);
//	} else {
//		NSLog(@"バックアップの復元に失敗：%@", error.description);
//	}
}
@end
