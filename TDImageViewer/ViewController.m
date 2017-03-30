//
//  ViewController.m
//  TDImageViewer
//
//  Created by tomfriwel on 30/03/2017.
//  Copyright © 2017 tomfriwel. All rights reserved.
//

#import "ViewController.h"
#import "TDZoomingScrollView.h"

@interface ViewController () <UIScrollViewDelegate> {
    UIScrollView *_pagingScrollView;
    NSUInteger _currentPageIndex;
    NSUInteger _previousPageIndex;
}

#define PADDING                  10
#define COUNT                  19

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPageIndex = 0;
    _previousPageIndex = NSUIntegerMax;
    
    [self setup];
    
    
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

-(void)setup {
    // Setup paging scrolling view
    CGRect pagingScrollViewFrame = [self frameForPagingScrollView];
    _pagingScrollView = [[UIScrollView alloc] initWithFrame:pagingScrollViewFrame];
    _pagingScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _pagingScrollView.pagingEnabled = YES;
    _pagingScrollView.delegate = self;
    _pagingScrollView.showsHorizontalScrollIndicator = NO;
    _pagingScrollView.showsVerticalScrollIndicator = NO;
    _pagingScrollView.backgroundColor = [UIColor blackColor];
    _pagingScrollView.contentSize = [self contentSizeForPagingScrollView];
    [self.view addSubview:_pagingScrollView];
    
    for (NSInteger i=0; i<COUNT; i++) {
        TDZoomingScrollView *scrollView = [[TDZoomingScrollView alloc] initWithImage:[UIImage imageNamed:@"test"]];
        scrollView.frame = [self frameForPageAtIndex:i];
        [_pagingScrollView addSubview:scrollView];
        [scrollView displayImage:[UIImage imageNamed:@"test"]];
        
    }
}
// Handle page changes
- (void)didStartViewingPageAtIndex:(NSUInteger)index {
    NSLog(@"%ld", index);
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // Calculate current page
    CGRect visibleBounds = _pagingScrollView.bounds;
    NSInteger index = (NSInteger)(floorf(CGRectGetMidX(visibleBounds) / CGRectGetWidth(visibleBounds)));
    if (index < 0) index = 0;
    if (index > COUNT - 1) index = COUNT - 1;
    NSUInteger previousCurrentPage = _currentPageIndex;
    _currentPageIndex = index;
    if (_currentPageIndex != previousCurrentPage) {
        [self didStartViewingPageAtIndex:index];
    }
    
}

#pragma mark - Frame Calculations

- (CGRect)frameForPagingScrollView {
    CGRect frame = self.view.bounds;// [[UIScreen mainScreen] bounds];
    frame.origin.x -= PADDING;
    frame.size.width += (2 * PADDING);
    return CGRectIntegral(frame);
}
- (CGRect)frameForPageAtIndex:(NSUInteger)index {
    // We have to use our paging scroll view's bounds, not frame, to calculate the page placement. When the device is in
    // landscape orientation, the frame will still be in portrait because the pagingScrollView is the root view controller's
    // view, so its frame is in window coordinate space, which is never rotated. Its bounds, however, will be in landscape
    // because it has a rotation transform applied.
    CGRect bounds = _pagingScrollView.bounds;
    CGRect pageFrame = bounds;
    pageFrame.size.width -= (2 * PADDING);
    pageFrame.origin.x = (bounds.size.width * index) + PADDING;
    return CGRectIntegral(pageFrame);
}
- (CGSize)contentSizeForPagingScrollView {
    // We have to use the paging scroll view's bounds to calculate the contentSize, for the same reason outlined above.
    CGRect bounds = _pagingScrollView.bounds;
    return CGSizeMake(bounds.size.width * COUNT, bounds.size.height);
}


@end
