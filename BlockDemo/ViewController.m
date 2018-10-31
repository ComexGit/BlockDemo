//
//  ViewController.m
//  BlockDemo
//
//  Created by yuqian on 2018/10/23.
//  Copyright © 2018 yuqian. All rights reserved.
//

#import "ViewController.h"

typedef void (^blk_k)(void);

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"Person instance:%@, %ld", self.name, self.age];
}

@end

@interface ViewController ()

@end


@implementation ViewController

void (^globalBlk)(void) = ^{
    NSLog(@"Global Block");
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
//    void (^ blk)(void) = ^(){
//        NSLog(@"In Block,without parameter.");
//    };
//    blk();
//    NSLog(@"%@",[blk class]);
//
//    NSLog(@"Global Block:%@", [[^{NSLog(@"Stack Block");} copy] class]);
    
//    __block int count = 11;
//    void (^ blk)(void) = ^(){
//        NSLog(@"In Block:%d", count);
//    };
//    count = 12;
//    blk();
//    NSLog(@"%@",[blk class]);
    
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
    
    
//    Person *person = [Person new];
//    person.name = @"max";
//    person.age = 27;
//
//    void (^ blk)(void) = ^(){
//        person.age = 18;
//        NSLog(@"In Block:%@", person);
//    };
//    blk();
//    NSLog(@"Out Block:%@", person);
//    NSLog(@"%@",[blk class]);

//    __block NSObject * obj = [[NSObject alloc]init];
//    NSLog(@"1.Block外 obj = %lu",(unsigned long)obj.retainCount);
//
//    void (^myBlock)(void) = [^{
//        NSLog(@"Block中 obj = %lu",(unsigned long)obj.retainCount);
//    }copy];
//
//    NSLog(@"2.Block外 obj = %lu",(unsigned long)obj.retainCount);
//
//    myBlock();
//
//    [myBlock release];
//
//    NSLog(@"3.Block外 obj = %lu",(unsigned long)obj.retainCount);

    __block NSObject* block_obj = [[NSObject alloc]init];
    NSMutableString *obj = [[NSMutableString alloc]init];
    
    NSLog(@"block_obj = [%@ , %p] , obj = [%@ , %p]",block_obj , &block_obj , obj , &obj);
    NSLog(@"Block外 block_obj = %lu, obj = %lu",(unsigned long)block_obj.retainCount, (unsigned long)obj.retainCount);
    
    
    void (^myBlock)(void) = [^{
        
        NSLog(@"Block中:block_obj = [%@ , %p] , obj = [%@ , %p]",block_obj , &block_obj , obj , &obj);
        NSLog(@"Block中 block_obj = %lu, obj = %lu",(unsigned long)block_obj.retainCount, (unsigned long)obj.retainCount);
    }copy];
    
    myBlock();

    
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

#pragma mark - block常用用法
//1.

#pragma mark - block种类s
//_NSConcreteStackBlock
//_NSConcreteMallocBlock
//_NSConcreteGlobalBlock

#pragma mark - block arc与mrc下的区别

#pragma mark - 自动截获变量 基本数据类型、对象、__block修饰符（对于截获的变量是否能修改，无非就是传值还是传址的问题s）

@end
