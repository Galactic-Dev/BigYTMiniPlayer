#import <objc/runtime.h>
#include <Foundation/Foundation.h>
#include <RemoteLog.h>
#include <UIKit/UIKit.h>

@interface YTMainAppVideoPlayerOverlayView : UIView
-(UIViewController *)_viewControllerForAncestor;
@end

@interface YTWatchMiniBarView : UIView
@end

%hook YTWatchMiniBarView
-(void)setWatchMiniPlayerLayout:(int)arg1 {
	%orig(1);
}
-(int)watchMiniPlayerLayout {
	return 1;
}
-(void)layoutSubviews {
    %orig;
    self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - self.frame.size.width), self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}
%end

%hook YTMainAppVideoPlayerOverlayView
-(BOOL)isUserInteractionEnabled {
    if([[self _viewControllerForAncestor].parentViewController.parentViewController isKindOfClass:%c(YTWatchMiniBarViewController)]) {
        return NO;
    }
    return %orig;
}
%end
