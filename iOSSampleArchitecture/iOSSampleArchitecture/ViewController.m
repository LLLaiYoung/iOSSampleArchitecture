//
//  ViewController.m
//  iOSSampleArchitecture
//
//  Created by LaiYoung_ on 2017/7/6.
//  Copyright © 2017年 LaiYoung_. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#error Note
    /**
     *  VC只负责页面布局／数据的显示／渲染，Model只负责提供数据／数据处理（网络／本地）
     *  所有的Request／Response 应该是一个 Entity
     *  所有的网络业务操作应该是一个对应业务类的Cateogry，例如：User类，User相关的Category就会有Info／Action／Sync...
     *  那么所有的业务Action就应该写在对应的Category
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
