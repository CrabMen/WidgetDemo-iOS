//
//  ViewController.m
//  HeWeather_WidgetDemo
//
//  Created by he on 2020/7/10.
//  Copyright © 2020 HeFengTianQi. All rights reserved.
//
#define SynopticNetworkColor_RGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define kSCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define kStatusBarAndNavigationBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height + 44.f
#define kUserKey @"请自行申请"

#import "ViewController.h"
#import <HeWeather_Plugin/HeWeather_Plugin.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setHeFengWidgetViewTypeHorizontal];
    [self setHeFengWidgetViewTypeLeftLarge];
    [self setHeFengWidgetViewTypeLeftLarge2];
    [self setHeFengWidgetViewTypeRightLarge];
    [self setHeFengWidgetViewTypeRightLarge2];
    [self setHeFengWidgetViewTypeVertical];
    
}
//显示横向单排
-(void)setHeFengWidgetViewTypeHorizontal{
    NSArray *typeArray =  @[@(HeFengConfigModelTypeLocation),
                            @(HeFengConfigModelTypeAlarmIcon),
                            @(HeFengConfigModelTypeAlarm),
                            @(HeFengConfigModelTypeTemp),
                            @(HeFengConfigModelTypeWeatherStateIcon),
                            @(HeFengConfigModelTypeWeatherState),
                            @(HeFengConfigModelTypeWindDirIcon),
                            @(HeFengConfigModelTypeWindSC),
                            @(HeFengConfigModelTypeAqiTitle),
                            @(HeFengConfigModelTypeQlty),
                            @(HeFengConfigModelTypeAqi),
                            @(HeFengConfigModelTypePcpnIcon),
                            @(HeFengConfigModelTypePcpn),
                            ];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0,  [[UIApplication sharedApplication] statusBarFrame].size.height + 44.f, self.view.frame.size.width, 20) ViewType:HeFengPluginViewTypeHorizontal UserKey:kUserKey Location:@"北京"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding = UIEdgeInsetsMake(4, 8, 4, 8);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(4, 8, 4, 8);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    //    view.themType = HeFengWidgetViewThemeTypeAuto;
    view.padding = UIEdgeInsetsZero;
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 2;
    view.isShowBorder = NO;
    view.isShowConer = NO;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor redColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self getImageViewWithView:view];
//    });
}
//显示左侧大布局右侧双布局
-(void)setHeFengWidgetViewTypeLeftLarge{
    
    NSArray *typeArray = @[@[@(HeFengConfigModelTypeWeatherStateIcon)],
                           @[@(HeFengConfigModelTypeTemp),
                             @(HeFengConfigModelTypeAlarmIcon),
                             @(HeFengConfigModelTypeAlarm),
                             @(HeFengConfigModelTypeAqiTitle),
                             @(HeFengConfigModelTypeQlty),
                             @(HeFengConfigModelTypeAqi),
                             @(HeFengConfigModelTypeLocation)],
                           @[@(HeFengConfigModelTypeWeatherState),
                             @(HeFengConfigModelTypeWindDirIcon),
                             @(HeFengConfigModelTypeWindSC),
                             @(HeFengConfigModelTypePcpnIcon),
                             @(HeFengConfigModelTypePcpn)]];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 40) ViewType:HeFengPluginViewTypeLeftLarge UserKey:kUserKey Location:@"北京"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding = UIEdgeInsetsMake(4, 8, 4, 8);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(4, 8, 4, 8);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    view.themType = HeFengPluginViewThemeTypeLight;
    view.padding = UIEdgeInsetsZero;
    view.backgroundColor = HeFengColorFromRGB(0xECECEC);
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 4;
    view.isShowBorder = NO;
    view.isShowConer = YES;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor redColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
}
//显示左侧大布局右侧双布局
-(void)setHeFengWidgetViewTypeLeftLarge2{
    
    NSArray *typeArray = @[@[@(HeFengConfigModelTypeTemp)],
                           @[@(HeFengConfigModelTypeWeatherStateIcon),
                             @(HeFengConfigModelTypeAlarmIcon),
                             @(HeFengConfigModelTypeAlarm),
                             @(HeFengConfigModelTypeAqiTitle),
                             @(HeFengConfigModelTypeQlty),
                             @(HeFengConfigModelTypeAqi),
                             @(HeFengConfigModelTypeLocation)],
                           @[@(HeFengConfigModelTypeWeatherState),
                             @(HeFengConfigModelTypeWindDirIcon),
                             @(HeFengConfigModelTypeWindSC),
                             @(HeFengConfigModelTypePcpnIcon),
                             @(HeFengConfigModelTypePcpn)]];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0, 260, self.view.frame.size.width, 40) ViewType:HeFengPluginViewTypeLeftLarge UserKey:kUserKey Location:@"北京"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                    model.textColor = HeFengColorFromRGB(0xFAFAFA);
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding = UIEdgeInsetsMake(4, 8, 4, 8);
                model.textColor = HeFengColorFromRGB(0xFAFAFA);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(4, 8, 4, 8);
            model.textColor = HeFengColorFromRGB(0xFAFAFA);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    view.themType = HeFengPluginViewThemeTypeLight;
    view.padding = UIEdgeInsetsZero;
    view.backgroundColor = HeFengColorFromRGB(0x313A44);
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 4;
    view.isShowBorder = NO;
    view.isShowConer = YES;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor redColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
   
}
//显示右侧大布局左侧双布局
-(void)setHeFengWidgetViewTypeRightLarge{
    NSArray *typeArray = @[
                           @[@(HeFengConfigModelTypeTemp)],
                           @[
                               @(HeFengConfigModelTypeLocation),
                               @(HeFengConfigModelTypeAqiTitle),
                               @(HeFengConfigModelTypeQlty),
                               @(HeFengConfigModelTypeAqi),
                               @(HeFengConfigModelTypeAlarmIcon),
                               @(HeFengConfigModelTypeAlarm),
                               @(HeFengConfigModelTypeWeatherStateIcon)],
                           @[
                               @(HeFengConfigModelTypePcpnIcon),
                               @(HeFengConfigModelTypePcpn),
                               @(HeFengConfigModelTypeWindDirIcon),
                               @(HeFengConfigModelTypeWindSC),
                               @(HeFengConfigModelTypeWeatherState)]
                           ];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0, 320, self.view.frame.size.width, 40) ViewType:HeFengPluginViewTypeRightLarge UserKey:kUserKey Location:@"北京"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                    model.textColor = HeFengColorFromRGB(0xFAFAFA);
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding = UIEdgeInsetsMake(4, 8, 4, 8);
                model.textColor = HeFengColorFromRGB(0xFAFAFA);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(4, 8, 4, 8);
            model.textColor = HeFengColorFromRGB(0xFAFAFA);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    view.themType = HeFengPluginViewThemeTypeAuto;
    view.padding = UIEdgeInsetsZero;
    view.backgroundColor = HeFengColorFromRGB(0xFAFAFA);
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 4;
    view.isShowBorder = NO;
    view.isShowConer = YES;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor redColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
}
//显示右侧大布局左侧双布局
-(void)setHeFengWidgetViewTypeRightLarge2{
    NSArray *typeArray = @[
                           @[@(HeFengConfigModelTypeWeatherStateIcon)],
                           @[
                               @(HeFengConfigModelTypeLocation),
                               @(HeFengConfigModelTypeAqiTitle),
                               @(HeFengConfigModelTypeQlty),
                               @(HeFengConfigModelTypeAqi),
                               @(HeFengConfigModelTypeAlarmIcon),
                               @(HeFengConfigModelTypeAlarm),
                               @(HeFengConfigModelTypeTemp)],
                           @[
                               @(HeFengConfigModelTypePcpnIcon),
                               @(HeFengConfigModelTypePcpn),
                               @(HeFengConfigModelTypeWindDirIcon),
                               @(HeFengConfigModelTypeWindSC),
                               @(HeFengConfigModelTypeWeatherState)]
                           ];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0, 380, self.view.frame.size.width, 40) ViewType:HeFengPluginViewTypeRightLarge UserKey:kUserKey Location:@"北京"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                    model.textColor = HeFengColorFromRGB(0xFAFAFA);
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding = UIEdgeInsetsMake(4, 8, 4, 8);
                model.textColor = HeFengColorFromRGB(0xFAFAFA);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(4, 8, 4, 8);
            model.textColor = HeFengColorFromRGB(0xFAFAFA);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    view.themType = HeFengPluginViewThemeTypeDark;
    view.padding = UIEdgeInsetsZero;
    //    view.backgroundColor = HeFengColorFromRGB(0xFAFAFA);
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 4;
    view.isShowBorder = NO;
    view.isShowConer = YES;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor blueColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
}
//显示竖向单排布局
-(void)setHeFengWidgetViewTypeVertical{
    NSArray *typeArray = @[@(HeFengConfigModelTypeLocation),
                           @(HeFengConfigModelTypeTemp),
                           @(HeFengConfigModelTypeWeatherStateIcon),
                           @(HeFengConfigModelTypeWeatherState),
                           @(HeFengConfigModelTypeWindDirIcon),
                           @(HeFengConfigModelTypeWindSC),
                           @(HeFengConfigModelTypeAqiTitle),
                           @(HeFengConfigModelTypeQlty),
                           @(HeFengConfigModelTypeAqi),
                           @(HeFengConfigModelTypeAlarmIcon),
                           @(HeFengConfigModelTypeAlarm),
                           @(HeFengConfigModelTypePcpnIcon),
                           @(HeFengConfigModelTypePcpn),
                           ];
    //初始化视图
    HeFengPluginView *view = [[HeFengPluginView alloc] initWithFrame:CGRectMake(0, 420, 50, 300) ViewType:HeFengPluginViewTypeVertical UserKey:kUserKey Location:@"武汉"];
    
    //视图属性设置
    NSMutableArray *configarray = [NSMutableArray array];
    [typeArray enumerateObjectsUsingBlock:^(id   obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *modelarray = [NSMutableArray array];
        if ([obj isKindOfClass:[NSArray class]]) {
            [obj enumerateObjectsUsingBlock:^(id  _Nonnull arrayobj, NSUInteger idx, BOOL * _Nonnull stop) {
                HeFengConfigModel *model = [HeFengConfigModel new];
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeTemp&&[obj count]==1) {
                    model.textFont = [UIFont systemFontOfSize:40];
                }
                if (idx==0&&[arrayobj integerValue]==HeFengConfigModelTypeWeatherStateIcon&&[obj count]==1) {
                    model.iconSize = 32;
                }
                model.type = [arrayobj integerValue];
                model.padding =UIEdgeInsetsMake(8, 4, 8, 4);
                [modelarray addObject:model];
            }];
            [configarray addObject:modelarray];
        }else{
            HeFengConfigModel *model = [HeFengConfigModel new];
            model.type = [obj integerValue];
            model.padding =UIEdgeInsetsMake(8, 4, 8, 4);
            [configarray addObject:model];
        }
    }];
    view.configArray = configarray;
    view.contentViewAlignmen = HeFengContentViewAlignmentCenter;
    //    view.themType = HeFengWidgetViewThemeTypeAuto;
    view.padding = UIEdgeInsetsZero;
    //    view.backgroundColor = HeFengColorFromRGB(0xFAFAFA);
    view.backgroundImageTitle = @"";
    view.borderColor = [UIColor greenColor];
    view.borderWidth =2;
    view.cornerRadius = 2;
    view.isShowBorder = NO;
    view.isShowConer = NO;
    //拖拽设置
    view.dragEnable = YES;
    view.freeRect = self.view.frame;
    view.dragDirection = HeFengPluginViewDragDirectionAny;
    view.isKeepBounds = NO;
    //导航栏设置
    //    view.navigationBarBackgroundColor = [UIColor redColor];
    //    view.progressColor = [UIColor blueColor];
    view.navBarBackImage = [UIImage imageNamed:@""];
    view.navBarCloseImage = [UIImage imageNamed:@""];
    [self.view addSubview:view];
    
}
@end
