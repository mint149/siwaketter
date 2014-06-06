//
//  FirstViewController.m
//  siwaketter
//
//  Created by 河野貴宏 on 2014/06/06.
//  Copyright (c) 2014年 Takahiro Kawano. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)leftSwipe:(id)sender;
- (IBAction)rightSwipe:(id)sender;
- (IBAction)downSwipe:(id)sender;
- (IBAction)upSwipe:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
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

	[self imageReload];
	//これがないとUISwipeGestureRecognizerを追加しても反応しなくなる
	self.imageView.userInteractionEnabled = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//スワイプ時の挙動
- (IBAction)leftSwipe:(id)sender {
	[self imageMove];
	[self imageReload];
	NSLog(@"左スワイプ");
}

- (IBAction)rightSwipe:(id)sender {
	[self imageMove];
	[self imageReload];
	NSLog(@"右スワイプ");
}

- (IBAction)downSwipe:(id)sender {
	NSLog(@"下スワイプ");
}

- (IBAction)upSwipe:(id)sender {
	NSLog(@"上スワイプ");
}

//画像の移動
-(void)imageMove{
	// ファイルマネージャを作成
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	// srcをdstに変更する
	NSString *src = [documentDirectory stringByAppendingPathComponent:files[fileNum]];
	NSString *dstDir = [documentDirectory stringByAppendingPathComponent:@"sample-dir2"];
	NSString *dst = [dstDir stringByAppendingPathComponent:files[fileNum]];
	
	NSError *error;
	
	// 文字列型の変数 path で指定したファイルまたはディレクトリが存在するかを調べます。
	if (![fileManager fileExistsAtPath:dstDir])
	{
		[fileManager createDirectoryAtPath:dstDir withIntermediateDirectories:YES attributes:nil error:&error];
		
	}
	
	// ファイルを移動
	BOOL result = [fileManager moveItemAtPath:src toPath:dst error:&error];
	if (result) {
		[files removeObjectAtIndex:fileNum];
		NSLog(@"ファイルの移動に成功：%@", dst);
	} else {
		NSLog(@"ファイルの移動に失敗：%@", error.description);
	}
}

//files[fileNum]の画像を表示する
- (void)imageReload{
	//キャッシュなしで画像を作成
	NSString *imagePath = [documentDirectory stringByAppendingPathComponent:files[fileNum]];
	UIImage *tempImage = [UIImage imageWithContentsOfFile:imagePath];
	
	self.imageView.image = tempImage;
}

@end
