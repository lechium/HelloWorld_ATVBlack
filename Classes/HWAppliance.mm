

#import "BackRowExtras.h"
#import "HWBasicMenu.h"


#define HELLO_ID @"hwHello"

#define HELLO_CAT [BRApplianceCategory categoryWithName:BRLocalizedString(@"Hello World", @"Hello World") identifier:HELLO_ID preferredOrder:0]


@interface BRTopShelfView (specialAdditions)

- (BRImageControl *)productImage;

@end


@implementation BRTopShelfView (specialAdditions)

- (BRImageControl *)productImage
{
	return MSHookIvar<BRImageControl *>(self, "_productImage");
}

@end


@interface TopShelfController : NSObject {
}
- (void)refresh; //4.2.1
- (void)selectCategoryWithIdentifier:(id)identifier;
- (id)topShelfView;
@end

@implementation TopShelfController


-(void)refresh
{
		//needed for 4.2.1 compat to keep AppleTV.app from endless reboot cycle
}

- (void)selectCategoryWithIdentifier:(id)identifier {
	
	//leave this entirely empty for controllerForIdentifier:args to work in Appliance subclass
}




- (BRTopShelfView *)topShelfView {
	
	BRTopShelfView *topShelf = [[BRTopShelfView alloc] init];
	BRImageControl *imageControl = [topShelf productImage];
	//BRImage *theImage = [BRImage imageWithPath:[[NSBundle bundleForClass:[HWBasicMenu class]] pathForResource:@"ApplianceIcon" ofType:@"png"]];
	BRImage *theImage = [[BRThemeInfo sharedTheme] largeGeniusIconWithReflection];
	[imageControl setImage:theImage];
	
	return topShelf;
}

@end

@interface HWAppliance: BRBaseAppliance {
	TopShelfController *_topShelfController;
	NSArray *_applianceCategories;
}
@property(nonatomic, readonly, retain) id topShelfController;

@end

@implementation HWAppliance
@synthesize topShelfController = _topShelfController;

+ (void)forceCrash
{
	NSArray *theArray = [NSArray arrayWithObjects:@"thejesus", @"heyzus", nil];
	NSLog(@"we should crash now");
	id theObject = [theArray objectAtIndex:2];
	NSLog(@"theObject: %@", theObject);
}

+ (void)initialize {
	
		//[HWAppliance forceCrash]; //in here solely to show how to use hwSymbols shell script	
}


- (id)init {
	if((self = [super init]) != nil) {
		_topShelfController = [[TopShelfController alloc] init];
		
		_applianceCategories = [[NSArray alloc] initWithObjects:HELLO_CAT,nil];
	
	} return self;
}

- (id)controllerForIdentifier:(id)identifier args:(id)args
{
	id menuController = nil;
	
	if ([identifier isEqualToString:HELLO_ID])
	{
		
		menuController = [[HWBasicMenu alloc] init];
		
	} 
	
	return menuController;
	
}



- (id)applianceCategories {
	return _applianceCategories;
}

- (id)identifierForContentAlias:(id)contentAlias {
	return @"Hello World";
}

- (id)selectCategoryWithIdentifier:(id)ident {
	//NSLog(@"selecteCategoryWithIdentifier: %@", ident);
	return nil;
}

- (BOOL)handleObjectSelection:(id)fp8 userInfo:(id)fp12 {

	return YES;
}

- (id)applianceSpecificControllerForIdentifier:(id)arg1 args:(id)arg2 {

	return nil;
}



- (id)localizedSearchTitle { return @"Hello World"; }
- (id)applianceName { return @"Hello World"; }
- (id)moduleName { return @"Hello World"; }
- (id)applianceKey { return @"Hello World"; }

@end





// vim:ft=objc
