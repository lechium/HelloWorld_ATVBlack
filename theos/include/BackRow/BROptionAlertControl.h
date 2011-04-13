/**
 * This header is generated by class-dump-z 0.2a.
 * class-dump-z is Copyright (C) 2009 by KennyTM~, licensed under GPLv3.
 *
 * Source: /System/Library/PrivateFrameworks/BackRow.framework/BackRow
 */

#import "BROptionDialog.h"


@interface BROptionAlertControl : BROptionDialog {
@private
	long _cancelIdx;	// 124 = 0x7c
}
+ (int)postAlertWithTitle:(id)title primaryText:(id)text secondaryText:(id)text3 firstButton:(id)button secondButton:(id)button5 thirdButton:(id)button6 defaultFocus:(int)focus;	// 0x315a5a21
+ (int)postAlertWithTitleAndCancel:(id)titleAndCancel primaryText:(id)text secondaryText:(id)text3 firstButton:(id)button secondButton:(id)button5 thirdButton:(id)button6 defaultFocus:(int)focus identifier:(id)identifier cancelIndex:(int)index;	// 0x315db435
+ (int)postDeleteConfirmationWithName:(id)name;	// 0x315db1cd
+ (void)postError:(id)error;	// 0x315db2a9
- (BOOL)_itemSelected:(id)selected;	// 0x315db149
- (BOOL)brEventAction:(id)action;	// 0x315a5b35
- (void)setCancelIndex:(long)index;	// 0x315a5abd
@end
