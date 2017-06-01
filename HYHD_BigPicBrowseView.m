//
//  HYHD_BigPicBrowseView.m
//  newsHD
//
//  Created by gx on 2017/2/27.
//  Copyright © 2017年 hyhd. All rights reserved.
//

#import "HYHD_BigPicBrowseView.h"
#import "HYHD_BigPicCollectionViewCell.h"

@interface HYHD_BigPicBrowseView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
{
    UICollectionView *_mainCollectionView;
    NSArray *_dataArr;
    NSInteger _currentIndex;
}
@end
@implementation HYHD_BigPicBrowseView
- (instancetype)initWithImageArray:(NSArray <NSString *>*)array currentIndex:(NSInteger)index{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    if (self) {
        _dataArr = [array copy];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _currentIndex = 0;
        _currentIndex = index;
        _mainCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        
        _mainCollectionView.delegate = self;
        _mainCollectionView.dataSource = self;
        _mainCollectionView.showsHorizontalScrollIndicator = NO;
        _mainCollectionView.pagingEnabled = YES;
        [self addSubview:_mainCollectionView];
        [_mainCollectionView registerClass:[HYHD_BigPicCollectionViewCell class] forCellWithReuseIdentifier:@"HYHD_BigPicCollectionViewCell"];
        [_mainCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:_currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewClicked)];
        [self addGestureRecognizer:tap];

    }
    return self;
}
- (void)imageViewClicked{
    [self removeFromSuperview];
}
#pragma mark----UICollectionViewDelegateFlowLayout----
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYHD_BigPicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYHD_BigPicCollectionViewCell" forIndexPath:indexPath];
    cell.data = _dataArr[indexPath.row];
    
    cell.totalCount = _dataArr.count;
    cell.currentIndex = indexPath.row + 1;
    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
