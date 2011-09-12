
/*
 
 ### EDITING HWBasicMenu.m 
 
	This class is pretty cut and dry, we have an init function, there are 9 functions and only 5 of them ever need to be tweaked for a new controller: init, previewControlForItem, itemForRow, itemSelected and itemForRow (and of course dealloc if you alloc any global variables that don't release themselves.)
 
 
 */

#import "HWBasicMenu.h"

@implementation HWBasicMenu

- (id) init
{
	if((self = [super init]) != nil) {
		
		//NSLog(@"%@ %s", self, _cmd);
		
		[self setListTitle:@"Hello World!"];
		
		/* 
		 
		 if you wanted to load your own image from your own resources folder you would use something like line 29 and 30, here we are just loading from BRThemeInfo
		 
		 */
		
		//NSString *settingsPng = [[NSBundle bundleForClass:[HWBasicMenu class]] pathForResource:@"picture" ofType:@"png"];
		//BRImage *sp = [BRImage imageWithPath:settingsPng];
		BRImage *sp = [[BRThemeInfo sharedTheme] gearImage];
		
	[self setListIcon:sp horizontalOffset:0.0 kerningFactor:0.15];
		
			//these are our menu options in our new controller
		
		_names = [[NSMutableArray alloc] init];
		[_names addObject:@"First Object"];
		[_names addObject:@"Second Object"];
		
		[[self list] setDatasource:self];
		
		return ( self );
		
	}
	
	return ( self );
}	

/* 
 
 these are the previews that are displayed on your left when a menu item has been selected, we use a basic case statement and return different images according to index
 
 */


- (id)previewControlForItem:(long)item

{
	BRImage *theImage = nil;
	
	switch (item) {
			
		case 0: //item one
		
			theImage = [[BRThemeInfo sharedTheme] largeGeniusIconWithReflection];
			break;
		
		case 1: //item two
			
			theImage = [[BRThemeInfo sharedTheme] networkPhotosImage];
			break;
		
	}
	
	/*
	 
	 there are more complex suppliers available for previewControllers, this one is just a basic one that returns and image with a reflection, we will delve into more complex examples in future tutorials.
	 
	 */
	
	BRImageAndSyncingPreviewController *obj = [[BRImageAndSyncingPreviewController alloc] init];
	
	[obj setImage:theImage];
	
	return ([obj autorelease]);
	
}

/*
 
 here we handle selecting an object from the list, right now we just log out to the syslog which item was selected, you can obviously be more complex than that :) 
 */


- (void)itemSelected:(long)selected; {
	
	NSDictionary *currentObject = [_names objectAtIndex:selected];
	NSLog(@"item selected: %@", currentObject);
	
	
}

/*
 
 Here we handle what kind of items are displayed in our list, we set the title from our _names variable and add different accessories (think of UITableView item accessories, same kind of idea)
 
 */

- (id)itemForRow:(long)row {
	if(row > [_names count])
		return nil;

	BRMenuItem * result = [[BRMenuItem alloc] init];
	NSString *theTitle = [_names objectAtIndex:row];
	[result setText:theTitle withAttributes:[[BRThemeInfo sharedTheme] menuItemTextAttributes]];
	
	switch (row) {
				
		case 0:
			
			[result addAccessoryOfType:0];
			
			break;
	
		case 1: 
			
			[result addAccessoryOfType:1]; //add a > to the menuItem on the far right.
			break;
			
		default:
			
			[result addAccessoryOfType:0];
			break;
	}
	
	return [result autorelease];
}

- (BOOL)rowSelectable:(long)selectable {
	return TRUE;
}

- (float)heightForRow:(long)row {
	return 0.0f;
}

- (long)itemCount {
	return [_names count];
}



- (id)titleForRow:(long)row {
	return [_names objectAtIndex:row];
}

-(void)dealloc
{
	[_names release];
	
	[super dealloc];
}


@end
