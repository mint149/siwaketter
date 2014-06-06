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
	model = [[MainModel alloc]init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)documentsFilesRestore:(id)sender {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	//_backup_内のファイルリストを取得
	NSString *backupDirectory = [model.documentDirectory stringByAppendingPathComponent:@"_backup_"];
	
	NSError *error = nil;
	NSMutableArray *files = (NSMutableArray*)[fileManager contentsOfDirectoryAtPath:backupDirectory error:&error];
	
	[self remove];
	
	for (NSString *file in files) {
		NSString *src = [backupDirectory stringByAppendingPathComponent:file];
		NSString *dst = [model.documentDirectory stringByAppendingPathComponent:file];
		error = nil;
		
		//ファイルがまだ存在していた場合はスキップ
		if (![fileManager fileExistsAtPath:dst]){
			// ファイルを移動
			BOOL result = [fileManager copyItemAtPath:src toPath:dst error:&error];
			if (result) {
				NSLog(@"バックアップ復元：%@", dst);
			} else {
				NSLog(@"バックアップの復元に失敗：%@", error.description);
			}
		}
	}
}

// [TODO] メソッド名変更
-(void)remove{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSError *error = nil;
	NSString *srcDir = [model.documentDirectory stringByAppendingPathComponent:@"sample-dir2"];
	NSMutableArray *files = (NSMutableArray*)[fileManager contentsOfDirectoryAtPath:srcDir error:&error];

	for (NSString *file in files) {
		NSString *src = [srcDir stringByAppendingPathComponent:file];
		BOOL result = [fileManager removeItemAtPath:src error:&error];
		if (result) {
			NSLog(@"削除：%@", file);
		} else {
			NSLog(@"削除失敗：%@", error.description);
		}
	}
}
@end
