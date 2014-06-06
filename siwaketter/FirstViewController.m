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
	NSString *documentDirectory = [documentDirectries lastObject];
	NSLog(@"%@",documentDirectory);
	
	// ドキュメントディレクトリにあるファイルリスト
	NSError *error = nil;
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSArray *files = [fileManager contentsOfDirectoryAtPath:documentDirectory error:&error];
	for (NSString *file in files) {
		NSLog(@"%@", file);
	}
	
	//	NSString *filePath = [NSString stringWithFormat:@"%@%@%@",documentDirectory, @"/", files[1]];
	//	NSLog(@"%@", filePath);
	
	// 画像の作成2．画像のキャッシュなし
	NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"../Documents/1" ofType:@"png"];
	UIImage *tempImage = [UIImage imageWithContentsOfFile:imagePath];
	
	
	self.imageView.image = tempImage;
	//これがないとUISwipeGestureRecognizerを追加しても反応しなくなる
	self.imageView.userInteractionEnabled = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)leftSwipe:(id)sender {
	NSLog(@"左スワイプ");
}

- (IBAction)rightSwipe:(id)sender {
	NSLog(@"右スワイプ");
}

- (IBAction)downSwipe:(id)sender {
	NSLog(@"下スワイプ");
}

- (IBAction)upSwipe:(id)sender {
	NSLog(@"上スワイプ");
}
@end
