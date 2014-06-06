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
	NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"../Documents/20140601_46" ofType:@"png"];
	UIImage *tempImage = [UIImage imageWithContentsOfFile:imagePath];
	
	
	self.imageView.image = tempImage;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
