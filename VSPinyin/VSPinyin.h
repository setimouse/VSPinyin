//
//  VSPinyin.h
//  VSPinyin
//
//  Created by Leeyan on 12-9-11.
//  Copyright (c) 2012年 Leeyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VSPinyin : NSObject {
    @private
    NSMutableDictionary *_pinyinDict;
}

- (NSSet *)pinyinFromCharacter:(unichar)character;

@end
