//
//  ViewController.m
//  BlockDemo
//
//  Created by yuqian on 2018/10/23.
//  Copyright © 2018 yuqian. All rights reserved.
//

#import "ViewController.h"

typedef void (^blk_k)(void);

@interface ViewController ()

@end


@implementation ViewController

void (^globalBlk)(void) = ^{
    NSLog(@"Global Block");
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block int count = 11;
    void (^ blk)(void) = ^(){
        NSLog(@"In Block:%d", count);
    };
    count = 12;
    blk();
    NSLog(@"%@",[blk class]);
    
//    globalBlk();
//    NSLog(@"%@",[globalBlk class]);
    
//    __block int count = 0;
//    blk_k blk = ^(){
//        NSLog(@"In Stack:%d", count);
//    };
//
//    count = 2;
//    blk();
//    NSLog(@"blk's Class:%@", [blk class]);//打印：blk's Class:__NSMallocBlock__
//    NSLog(@"Global Block:%@", [^{NSLog(@"Global Block");} class]);//打印：Global Block:__NSGlobalBlock__
//    NSLog(@"Copy Block:%@", [[^{NSLog(@"Copy Block:%d",count);} copy] class]);//打印：Copy Block:__NSMallocBlock__
//    NSLog(@"Stack Block:%@", [^{NSLog(@"Stack Block:%d",count);} class]);//打印：Stack Block:__NSStackBlock__
    
//    [self func](1);
//    self.func(1).func(1);
}

//- (ViewController* (^)(int)) func {
//
//    return ^(int a) {
//        NSLog(@"%s, %d", __func__, a);
//        return self;
//    };
//}

@end
