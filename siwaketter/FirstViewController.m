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
	files = [fileManager contentsOfDirectoryAtPath:documentDirectory error:&error];
	for (NSString *file in files) {
		NSLog(@"%@", file);
	}
	
	//DS_Storeを飛ばすために1とする
	fileNum = 1;

	[self imageReload];
	//	NSString *filePath = [NSString stringWithFormat:@"%@%@%@",documentDirectory, @"/", files[1]];
	//	NSLog(@"%@", filePath);
	

	//これがないとUISwipeGestureRecognizerを追加しても反応しなくなる
	self.imageView.userInteractionEnabled = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)leftSwipe:(id)sender {
	fileNum-=1;
	[self imageReload];
	NSLog(@"左スワイプ");
}

- (IBAction)rightSwipe:(id)sender {
	fileNum+=1;
	[self imageReload];
	NSLog(@"右スワイプ");
}

- (IBAction)downSwipe:(id)sender {
	NSLog(@"下スワイプ");
}

- (IBAction)upSwipe:(id)sender {
	NSLog(@"上スワイプ");
}

- (void)imageReload{
	//キャッシュなしで画像を作成
	NSString *imagePath = [documentDirectory stringByAppendingPathComponent:files[fileNum]];
	UIImage *tempImage = [UIImage imageWithContentsOfFile:imagePath];
	
	self.imageView.image = tempImage;
}

@end
