//
//  XLSlider.h
//  XLSlider
//

#import <UIKit/UIKit.h>
@class XLSlider;

typedef void (^SliderValueChangeBlock) (XLSlider *slider);
typedef void (^SliderFinishChangeBlock) (XLSlider *slider);
typedef void (^DraggingSliderBlock) (XLSlider *slider);

@interface XLSlider : UIView

@property (nonatomic, assign) CGFloat value;        /* From 0 to 1 */
@property (nonatomic, assign) CGFloat middleValue;  /* From 0 to 1 */

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat sliderDiameter;
@property (nonatomic, strong) UIColor *sliderColor;
@property (nonatomic, strong) UIColor *maxColor;
@property (nonatomic, strong) UIColor *middleColor;
@property (nonatomic, strong) UIColor *minColor;

@property (nonatomic, copy) SliderValueChangeBlock valueChangeBlock;
@property (nonatomic, copy) SliderFinishChangeBlock finishChangeBlock;
@property (nonatomic, strong) DraggingSliderBlock draggingSliderBlock;


@end
