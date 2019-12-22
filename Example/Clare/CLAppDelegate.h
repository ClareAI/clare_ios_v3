//
//  CLAppDelegate.h
//  Clare
//
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Clare/Clare.h>

@interface CLAppDelegate : UIResponder <UIApplicationDelegate,ConversationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end
