

#import "HWBasicMenu.h"

@implementation HWBasicMenu

- (id) init
{
	if((self = [super init]) != nil) {
		
		//NSLog(@"%@ %s", self, _cmd);
		
		[self setListTitle:@"Hello World!"];
		
		//NSString *settingsPng = [[NSBundle bundleForClass:[HWBasicMenu class]] pathForResource:@"picture" ofType:@"png"];
		//BRImage *sp = [BRImage imageWithPath:settingsPng];
		BRImage *sp = [[BRThemeInfo sharedTheme] gearImage];
		
	[self setListIcon:sp horizontalOffset:0.0 kerningFactor:0.15];
		
		_names = [[NSMutableArray alloc] init];
		[_names addObject:@"First Object"];
		[_names addObject:@"Second Object"];
		
		[[self list] setDatasource:self];
		
		return ( self );
		
	}
	
	return ( self );
}	


-(void)dealloc
{
	[_names release];

	[super dealloc];
}


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
	
	
	BRImageAndSyncingPreviewController *obj = [[BRImageAndSyncingPreviewController alloc] init];
	
	[obj setImage:theImage];
	
	return ([obj autorelease]);
	
}



- (void)itemSelected:(long)selected; {
	
	NSDictionary *currentObject = [_names objectAtIndex:selected];
	NSLog(@"item selected: %@", currentObject);
	
}

- (float)heightForRow:(long)row {
	return 0.0f;
}

- (long)itemCount {
	return [_names count];
}

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
			
			[result addAccessoryOfType:1]; //folder
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

- (id)titleForRow:(long)row {
	return [_names objectAtIndex:row];
}

@end
