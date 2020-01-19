#define kWidth [UIScreen mainScreen].bounds.size.width 
@interface YTNGWatchMiniBarView : UIView
- (void)setWatchMiniPlayerLayout:(NSInteger)arg1;
@property (nonatomic, assign, readwrite) NSInteger watchMiniPlayerLayout;
@end

%hook YTNGWatchMiniBarView


- (void)layoutSubviews {


	%orig;
	MSHookIvar<NSInteger>(self, "_watchMiniPlayerLayout") = 1;

	CGRect newFrame = self.frame;
	CGFloat kMiniPlayerWidth = self.frame.size.width;
  
	newFrame.origin.x = kWidth - kMiniPlayerWidth;
	[self setFrame:newFrame];




}
%end
