/*
 CREATED BY   : SherBahadurSINGH
 CREATION DATE: 21/03/2015
 */

#import <UIKit/UIKit.h>

@interface CAlertView : UIView
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *message,*strCancle,*strOther;
@property(nonatomic,strong)UIView *viewTransparen,*viewMessageAndButtonArea;
@property(nonatomic,strong)UIButton *btnCancle,*btnOther;
@property(nonatomic,strong)UIColor *btnCancleBackgroundColorForNormalState;
@property(nonatomic,strong)UIImage *imageBtnCancleBackgroundColorForNormalState;
@property(nonatomic,strong)UIImage *imageBtnCancleBackgroundColorForSelectedState;
@property(nonatomic,strong)UIColor *btnOtherBackgroundColorForNormalState;
@property(nonatomic,strong)UIImage *imageBtnOtherBackgroundColorForNormalState;
@property(nonatomic,strong)UIImage *imageBtnOtherBackgroundColorForSelectedState;


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitle;

-(void)setBtnCancle:(UIButton *)btnCancle;
-(void)setButtonOtherTittle:(NSString *)strOther;
-(void)setButtonCancleTittle:(NSString *)strCancle;

-(void)show;




@end
