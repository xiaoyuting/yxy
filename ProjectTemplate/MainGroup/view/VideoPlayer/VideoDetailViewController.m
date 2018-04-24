//
//  VideoDetailViewController.m
//  XLVideoPlayer
//

#import "VideoDetailViewController.h"
#import "XLVideoPlayer.h"

@interface VideoDetailViewController ()

@property (nonatomic, strong) XLVideoPlayer *player;

@end

@implementation VideoDetailViewController

- (XLVideoPlayer *)player {
    if (!_player) {
        _player = [[XLVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 64, self.view.frame.size.width, 250);
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.videoTitle;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.player.videoUrl = self.mp4_url;
    [self.view addSubview:self.player];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.player destroyPlayer];
    self.player = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
