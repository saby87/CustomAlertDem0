/*
 CREATED BY   : SherBahadurSINGH
 CREATION DATE: 21/03/2015
 */

#define COMMON_BUTTON_HEIGHT 30
#define COMMON_ALERT_VIEW_WIDTH 240

#import "CAlertView.h"
@implementation CAlertView


- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
        
        _viewTransparen=[[UIView alloc]initWithFrame:CGRectMake(0, 0,width,height)];
        [_viewTransparen setBackgroundColor:[UIColor lightGrayColor]];
        [self addSubview:_viewTransparen];
        
        _viewMessageAndButtonArea=[[UIView alloc]initWithFrame:CGRectMake(0, 0,COMMON_ALERT_VIEW_WIDTH,COMMON_ALERT_VIEW_WIDTH)];
        [_viewMessageAndButtonArea setBackgroundColor:[UIColor whiteColor]];
        [_viewMessageAndButtonArea.layer setCornerRadius:5];
        [_viewTransparen addSubview:_viewMessageAndButtonArea];
        [_viewMessageAndButtonArea setCenter:_viewTransparen.center];
        
        _btnCancleBackgroundColorForNormalState=[UIColor lightTextColor];
        _btnOtherBackgroundColorForNormalState=[UIColor lightTextColor];

    }
    return self;
}


/*
 Method purpose: To set Title
 Method CreatedBy: SherBahadur
 Input Parameters: title
 Output Result:seted title
 */
-(void)setTitle:(NSString *)title{
    _title=title;
}

/*
 Method purpose: To set Message
 Method CreatedBy: SherBahadur
 Input Parameters: message
 Output Result:seted Message
 */
-(void)setMessage:(NSString *)message{
    _message=message;
}

/*
 Method purpose: To set Title of cancle button
 Method CreatedBy: SherBahadur
 Input Parameters: cancle button title
 Output Result:seted title of cancle button
 */
-(void)setButtonCancleTittle:(NSString *)strCancle{
    _strCancle=strCancle;
}

/*
 Method purpose: To set Title of other button
 Method CreatedBy: SherBahadur
 Input Parameters: other button title
 Output Result:seted title of other button
 */
-(void)setButtonOtherTittle:(NSString *)strOther{
    _strOther=strOther;
}


/*
 Method purpose: To set view Layout before show
 Method CreatedBy: SherBahadur
 Input Parameters: nothing
 Output Result:seted layout
 */
-(void)layoutSubviews{
    UILabel *lblTittle=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, _viewMessageAndButtonArea.frame.size.width,15)];
    [lblTittle setText:_title];
    [lblTittle setTextAlignment:NSTextAlignmentCenter];
    [_viewMessageAndButtonArea addSubview:lblTittle];
    [lblTittle sizeToFit];
    [lblTittle setCenter:CGPointMake(COMMON_ALERT_VIEW_WIDTH/2, lblTittle.center.y)];

    UILabel *lblMessage=[[UILabel alloc]initWithFrame:CGRectMake(0,lblTittle.frame.origin.y+lblTittle.frame.size.height+10, _viewMessageAndButtonArea.frame.size.width,15)];
    [lblMessage setText:_message];
    [lblMessage setTextAlignment:NSTextAlignmentCenter];
    [_viewMessageAndButtonArea addSubview:lblMessage];
    [lblMessage setNumberOfLines:0];
    [lblMessage sizeToFit];
    [lblMessage setCenter:CGPointMake(120, lblMessage.center.y)];
    
    if(CGRectGetMaxY(lblMessage.frame)<[UIScreen mainScreen].bounds.size.height-20){
        [_viewMessageAndButtonArea setFrame:CGRectMake(0,_viewMessageAndButtonArea.frame.origin.y, _viewMessageAndButtonArea.frame.size.width,CGRectGetMaxY(lblMessage.frame)+COMMON_BUTTON_HEIGHT+10)];
        [_viewMessageAndButtonArea setCenter:_viewTransparen.center];
    }else{
        [_viewMessageAndButtonArea setFrame:CGRectMake(0,_viewMessageAndButtonArea.frame.origin.y, _viewMessageAndButtonArea.frame.size.width,[UIScreen mainScreen].bounds.size.height)];
        [_viewMessageAndButtonArea setCenter:_viewTransparen.center];
    }
    
    _btnCancle=[[UIButton alloc]init];
    if(!_strOther&&_strCancle){
        [_btnCancle setFrame:CGRectMake(0,_viewMessageAndButtonArea.frame.size.height-COMMON_BUTTON_HEIGHT, _viewMessageAndButtonArea.frame.size.width,COMMON_BUTTON_HEIGHT)];
        [_btnCancle setBackgroundColor:_btnCancleBackgroundColorForNormalState];
        [_btnCancle setTitle:_strCancle forState:UIControlStateNormal];
        [_btnCancle setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_viewMessageAndButtonArea addSubview:_btnCancle];
        

        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_btnCancle.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(5,5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _btnCancle.bounds;
        maskLayer.path  = maskPath.CGPath;
        _btnCancle.layer.mask = maskLayer;
    
    }else if(_strOther){
        [_btnCancle setFrame:CGRectMake(0,_viewMessageAndButtonArea.frame.size.height-COMMON_BUTTON_HEIGHT, 119.5,COMMON_BUTTON_HEIGHT)];
        [_btnCancle setBackgroundColor:_btnCancleBackgroundColorForNormalState];
        [_btnCancle setTitle:_strCancle forState:UIControlStateNormal];
        [_btnCancle setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_viewMessageAndButtonArea addSubview:_btnCancle];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_btnCancle.bounds byRoundingCorners:(UIRectCornerBottomLeft) cornerRadii:CGSizeMake(5,5)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = _btnCancle.bounds;
        maskLayer.path  = maskPath.CGPath;
        _btnCancle.layer.mask = maskLayer;
        
        UIView *sepratorHoriztical=[[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_btnCancle.frame), _viewMessageAndButtonArea.frame.size.height-COMMON_BUTTON_HEIGHT, 1, COMMON_BUTTON_HEIGHT)];
        [sepratorHoriztical setBackgroundColor:[UIColor lightGrayColor]];
        [_viewMessageAndButtonArea addSubview:sepratorHoriztical];
        _btnOther=[[UIButton alloc]init];
        [_btnOther setFrame:CGRectMake(CGRectGetMaxX(_btnCancle.frame)+1,_viewMessageAndButtonArea.frame.size.height-COMMON_BUTTON_HEIGHT,120,COMMON_BUTTON_HEIGHT)];
        [_btnOther setBackgroundColor:_btnOtherBackgroundColorForNormalState];
        [_btnOther setTitle:_strOther forState:UIControlStateNormal];
        [_btnOther setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_viewMessageAndButtonArea addSubview:_btnOther];
        
        UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:_btnOther.bounds byRoundingCorners:(UIRectCornerBottomRight) cornerRadii:CGSizeMake(5,5)];
        CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
        maskLayer1.frame = _btnOther.bounds;
        maskLayer1.path  = maskPath1.CGPath;
        _btnOther.layer.mask = maskLayer1;
    }
    
    if(_imageBtnCancleBackgroundColorForNormalState){
        [_btnCancle setBackgroundImage:_imageBtnCancleBackgroundColorForNormalState forState:UIControlStateNormal];
    }
    if (_imageBtnCancleBackgroundColorForSelectedState) {
        [_btnCancle setBackgroundImage:_imageBtnCancleBackgroundColorForSelectedState forState:UIControlStateSelected];
    }
    if(_imageBtnOtherBackgroundColorForNormalState){
        [_btnOther setBackgroundImage:_imageBtnOtherBackgroundColorForNormalState forState:UIControlStateNormal];
    }
    if (_imageBtnOtherBackgroundColorForSelectedState) {
        [_btnOther setBackgroundImage:_imageBtnOtherBackgroundColorForSelectedState forState:UIControlStateSelected];
    }

    
    [_btnCancle addTarget:self action:@selector(setBtnCancle:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *sepratorVertical=[[UIView alloc]initWithFrame:CGRectMake(0,_btnCancle.frame.origin.y-1,COMMON_ALERT_VIEW_WIDTH,1)];
    [sepratorVertical setBackgroundColor:[UIColor lightGrayColor]];
    [_viewMessageAndButtonArea addSubview:sepratorVertical];
}

/*
 Method purpose: To show view on top window
 Method CreatedBy: SherBahadur
 Input Parameters: nothing
 Output Result:show view
 */
-(void)show{
    [self layoutSubviews];
    [[[UIApplication sharedApplication] keyWindow] addSubview:_viewTransparen];
}

/*
 Method purpose: To initalize view with title and message
 Method CreatedBy: SherBahadur
 Input Parameters: title,message,cancle and other button names
 Output Result:initalized view
 */

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitle{
    self = [super init];
    if (self) {
        _title=title;
        _message=message;
        _strCancle=cancelButtonTitle;
        _strOther=otherButtonTitle;
        
    }
    return self;
}

/*
 Method purpose: To hide view from window
 Method CreatedBy: SherBahadur
 Input Parameters: button cancle
 Output Result:hideed button from window
 */
-(void)setBtnCancle:(UIButton *)btnCancle{
    [_viewTransparen removeFromSuperview];
    
}

/*
 Method purpose: To set cancle button color for normal state
 Method CreatedBy: SherBahadur
 Input Parameters:uicolor
 Output Result:seted color of cancle button for normal state
 */
-(void)setBtnCancleBackgroundColorForNormalState:(UIColor *)btnCancleBackgroundColorForNormalState{
    _btnCancleBackgroundColorForNormalState=btnCancleBackgroundColorForNormalState;
}

/*
 Method purpose: To set other button color for normal state
 Method CreatedBy: SherBahadur
 Input Parameters:uicolor
 Output Result:seted color of other button for normal state
 */
-(void)setBtnOtherBackgroundColorForNormalState:(UIColor *)btnOtherBackgroundColorForNormalState{
    _btnOtherBackgroundColorForNormalState=btnOtherBackgroundColorForNormalState;
}

/*
 Method purpose: To set cancle button image for normal state
 Method CreatedBy: SherBahadur
 Input Parameters:image
 Output Result:seted image of cancle button for normal state
 */
-(void)setImageBtnCancleBackgroundColorForNormalState:(UIImage *)imageBtnCancleBackgroundColorForNormalState{
    _imageBtnCancleBackgroundColorForNormalState=imageBtnCancleBackgroundColorForNormalState;
}
/*
 Method purpose: To set cancle button image for selected state
 Method CreatedBy: SherBahadur
 Input Parameters:image
 Output Result:seted image of cancle button for selected state
 */
-(void)setImageBtnCancleBackgroundColorForSelectedState:(UIImage *)imageBtnCancleBackgroundColorForSelectedState{
    _imageBtnCancleBackgroundColorForSelectedState=imageBtnCancleBackgroundColorForSelectedState;
}

/*
 Method purpose: To set other button image for normal state
 Method CreatedBy: SherBahadur
 Input Parameters:image
 Output Result:seted image of other button for normal state
 */

-(void)setImageBtnOtherBackgroundColorForNormalState:(UIImage *)imageBtnOtherBackgroundColorForNormalState{
    _imageBtnOtherBackgroundColorForNormalState=imageBtnOtherBackgroundColorForNormalState;
}
/*
 Method purpose: To set other button image for selected state
 Method CreatedBy: SherBahadur
 Input Parameters:image
 Output Result:seted image of other button for selected state
 */
-(void)setImageBtnOtherBackgroundColorForSelectedState:(UIImage *)imageBtnOtherBackgroundColorForSelectedState{
    _imageBtnOtherBackgroundColorForSelectedState=imageBtnOtherBackgroundColorForSelectedState;
}
@end
