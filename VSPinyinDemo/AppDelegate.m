//
//  AppDelegate.m
//  VSPinyinDemo
//
//  Created by Leeyan on 12-9-11.
//  Copyright (c) 2012年 Leeyan. All rights reserved.
//

#import "AppDelegate.h"
#import "VSPinyin.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    VSPinyin *pinyin = [[VSPinyin alloc] init];
    
    NSString *string = @"很多人都曾预想，胡锦涛主席在APEC会议上不会见野田的，因为野田首相并没打算中断“国有化”钓鱼岛进程，因此中国需要给日本一个脸色看看。不过，大国外交不是斗气，而是维护国家利益。今天，胡锦涛与野田见面，我想，一是这在国际会议场合，完全不打照面也不现实。其次，今天的见面不是正式会谈、会见，中日之间目前还不具备领导人正式会见的氛围和条件。更重要的是，胡锦涛主席这次见野田，从相关报道看，主要是表明中国对钓鱼岛的立场，是警告日本。胡锦涛的话，说得很严厉，一是表明中国坚决反对所谓的“购岛”行动，二是警告日本必须充分认识事态的严重性，不要做出错误的决定。这也是迄今为止，中国最高层级的领导人对钓鱼岛表达明确而坚定的立场，提醒日本悬崖勒马。为什么胡锦涛要见野田，我个人认为，在APEC会议期间，中国最高领导人发话，谈钓鱼岛问题，等于向世界告知钓鱼岛是中日争端区域，而不是日本所谓的“钓鱼岛属于日本”，这一举动的影响力，超过中日两国间的交涉。中国领导人都讲话了，日本如果还要再往前走半步，做出国有化钓鱼岛的错误决定，那么中国就可能采取新的措施，来反制日本，而不仅仅在外交层面抗议了。";
    NSMutableString *output = [NSMutableString string];
    NSLog(@"start");
    for (int i = 0; i < [string length]; i++) {
        NSSet *py = [pinyin pinyinFromCharacter:[string characterAtIndex:i]];
        [output appendFormat:@"\npy: %@, %@", [string substringWithRange:NSMakeRange(i, 1)], py];
    }
    NSLog(@"output: %@", output);
    [pinyin release];
    
    return YES;
}

@end
