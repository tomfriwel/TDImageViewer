//
//  TDPageController.m
//  TDImageViewer
//
//  Created by tomfriwel on 30/03/2017.
//  Copyright © 2017 tomfriwel. All rights reserved.
//

#import "TDPageController.h"

@interface TDPageController ()

@end

@implementation TDPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UIPageViewControllerDataSource And UIPageViewControllerDelegate

#pragma mark 返回上一个ViewController对象
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
//    
//    NSUInteger index = [(JSImageViewerController *)viewController index];
//    
//    [self.indexDelegate pageIndexDidChanged:index sum:self.imageInfo.count];
//    
//    if (index == 0) {
//        return nil;
//    }
//    index--;
//    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
//    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法,自动来维护次序
//    // 不用我们去操心每个ViewController的顺序问题
//    return [self viewControllerAtIndex:index];
//}
//
//#pragma mark 返回下一个ViewController对象
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
//    
//    NSUInteger index = [(JSImageViewerController *)viewController index];
//    
//    [self.indexDelegate pageIndexDidChanged:index sum:self.imageInfo.count];
//    
//    index++;
//    if (index == [self.imageInfo count]) {
//        return nil;
//    }
//    return [self viewControllerAtIndex:index];
//    
//    
//}
//
//#pragma mark - 根据index得到对应的UIViewController
//- (JSImageViewerController *)viewControllerAtIndex:(NSUInteger)index {
//    if (([self.imageInfo count] == 0) || (index >= [self.imageInfo count])) {
//        return nil;
//    }
//    return [self.pageViewers objectAtIndex:index];
//}
//
//#pragma mark - 数组元素值，得到下标值
//
//- (NSUInteger)indexOfViewController:(JSImageViewerController *)viewController {
//    return [viewController index];
//}

@end
