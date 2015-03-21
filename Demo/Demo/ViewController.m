/*
 CREATED BY   : SherBahadurSINGH
 CREATION DATE: 21/03/2015
 */

#import "ViewController.h"
#import "CAlertView.h"


@interface ViewController (){
    CAlertView *alert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClickedCAlert:(id)sender {

    alert=[[CAlertView alloc]init];
    [alert setTitle:@"tittle"];
    [alert setMessage:@"message"];
    [alert setButtonCancleTittle:@"cancle"];
    [alert setBtnCancleBackgroundColorForNormalState:[UIColor orangeColor]];
    [alert setButtonOtherTittle:@"OK"];
    [alert setBtnOtherBackgroundColorForNormalState:[UIColor purpleColor]];
    [alert show];
    [alert.btnOther addTarget:self action:@selector(setBtnOther:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)setBtnOther:(UIButton *)btnOther{
    // code for action of other button
    [alert setBtnCancle:alert.btnCancle];
}

@end
