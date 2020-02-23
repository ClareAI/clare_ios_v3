//
//  CLAppDelegate.h
//  Clare
//
//  Created by 1992liumouren@gmail.com on 02/24/2020.
//  Copyright (c) 2020 1992liumouren@gmail.com. All rights reserved.
//

@import UIKit;
#import <CoreData/CoreData.h>
#import <Clare/Clare.h>

@interface CLAppDelegate : UIResponder <UIApplicationDelegate,ConversationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
