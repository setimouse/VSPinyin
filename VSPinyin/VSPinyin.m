//
//  VSPinyin.m
//  VSPinyin
//
//  Created by Leeyan on 12-9-11.
//  Copyright (c) 2012年 Leeyan. All rights reserved.
//

#import "VSPinyin.h"

@implementation VSPinyin

- (void)dealloc {
    [_pinyinDict release];
    [super dealloc];
}

- (NSSet *)pinyinFromCharacter:(unichar)character {
    if (nil == _pinyinDict) {
        NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"VSPinyin" ofType:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithPath:path];
        NSString *achPath = [bundle pathForResource:@"pinyin" ofType:@"ach"];
        _pinyinDict = [[NSKeyedUnarchiver unarchiveObjectWithFile:achPath] retain];
        [pool drain];
    }
    
    NSString *key = [[NSString alloc] initWithCharacters:&character length:1];
    NSSet *pySet = [_pinyinDict objectForKey:key];
    if (nil == pySet) {
        pySet = [NSSet setWithObject:key];
    }
    [key release];
    
    return pySet;
}


@end
