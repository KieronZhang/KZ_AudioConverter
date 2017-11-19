//
//  ViewController.m
//  KZ_AudioConverter
//
//  Created by Kieron Zhang on 2017/9/28.
//  Copyright © 2017年 Kieron Zhang. All rights reserved.
//

#import "ViewController.h"
#import <KZ_AudioConverterFramework/KZ_AudioConverter.h>
#import <KZ_AudioPlayerFramework/KZ_AudioPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *transButton = [UIButton buttonWithType:UIButtonTypeCustom];
    transButton.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds) / 2, 100);
    transButton.backgroundColor = [UIColor yellowColor];
    [transButton setTitle:@"转换" forState:UIControlStateNormal];
    [transButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [transButton addTarget:self action:@selector(transButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:transButton];
    
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    playButton.frame = CGRectMake(CGRectGetWidth(self.view.bounds) / 2, 100, CGRectGetWidth(self.view.bounds) / 2, 100);
    playButton.backgroundColor = [UIColor greenColor];
    [playButton setTitle:@"Play" forState:UIControlStateNormal];
    [playButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playButton addTarget:self action:@selector(playButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playButton];
}

- (void)transButtonTapped {
    NSString *amrFilePath = [[NSBundle mainBundle] pathForResource:@"001" ofType:@"amr"];
    NSLog(@"%@", amrFilePath);
    NSString *wavFilePath = [[self class] audioFilePathWithWAVFilename:@"001"];
    [KZ_AudioConverter amrToWav:amrFilePath wavSavePath:wavFilePath];
    NSData *data = [NSData dataWithContentsOfFile:wavFilePath];
    NSLog(@"%lu", data.length);
}

- (void)playButtonTapped {
    NSString *wavFilePath = [[self class] audioFilePathWithWAVFilename:@"001"];
    [[KZ_AudioPlayer sharedPlayerWithDelegate:nil] playFilePath:wavFilePath currentTime:0];
}

+ (NSString *)createAudioPath {
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = dirPaths[0];
    NSString *savedVoicePath = [docsDir stringByAppendingPathComponent:@"ChatCaches/Voice"];
    BOOL isDir = NO;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL existed = [fileManager fileExistsAtPath:savedVoicePath isDirectory:&isDir];
    if (!(isDir == YES && existed == YES)) {
        [fileManager createDirectoryAtPath:savedVoicePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return savedVoicePath;
}

+ (NSString *)audioFilePathWithWAVFilename:(NSString *)filename {
    return [[[self class] createAudioPath] stringByAppendingString:[NSString stringWithFormat:@"/%@.wav", filename]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
