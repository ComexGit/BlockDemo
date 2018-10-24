//
//  main.m
//  BlockDemo
//
//  Created by yuqian on 2018/10/23.
//  Copyright © 2018 yuqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        int count = 10;
        void (^ blk)(void) = ^(){
            NSLog(@"In Block:%d", count);
        };
        blk();
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
