//
//  L_EditPersonInfoVC.m
//  yuehui
//
//  Created by luhongyu on 17/5/18.
//  Copyright © 2017年 luhongyu. All rights reserved.
//
#define  Max_Num_TextView 80
#import "L_EditPersonInfoVC.h"
#import <IQTextView.h>
@interface L_EditPersonInfoVC ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet IQTextView *textVDesc;
@property (weak, nonatomic) IBOutlet UILabel *labMaxLength;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightBgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topTextV;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTextV;

//添加一个bool类型的属性 textView字数
@property (nonatomic, assign) BOOL isNameTextFieldEnbable;

@end

@implementation L_EditPersonInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];

    if (1 == self.type) {
        [self setTitle:@"个性签名"];
        _textVDesc.placeholder = @"输入你的个性签名...";
    }else{
        [self setTitle:@"邮箱"];
        self.heightBgView.constant = 44;
        self.topTextV.constant = 0;
        self.bottomTextV.constant = 0;
        _textVDesc.scrollEnabled = NO;
        _textVDesc.placeholder = @"输入你的邮箱地址";
        [_labMaxLength removeFromSuperview];
    }
    
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(save)];
    
    self.navigationItem.rightBarButtonItem = itemRight;
    
    //初始化为YES，让textView开始输入有反应
    self.isNameTextFieldEnbable = YES;
    
    //UITextView的监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textchange:) name:UITextViewTextDidChangeNotification object:nil];

}

- (void)save{

    
}


#pragma -mark TextV Delegate
//是否允许键盘输入
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    //返回删除键
    if ([text isEqualToString:@""]) {
        
        return YES;
        
    }else{
        
        return _isNameTextFieldEnbable;
    }
}

#pragma -mark NOTIFICATION

/** 监听方法 */
-(void)textchange:(NSNotification *)note{
    
    //监听开始默认YES
    self.isNameTextFieldEnbable = YES;
    
    //当前输入语言状态
    UITextInputMode *mode = (UITextInputMode *)[UITextInputMode activeInputModes][0];
    NSString *lang = mode.primaryLanguage;
    
    //汉字
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self.textVDesc markedTextRange];
        //高亮状态的start位置
        UITextPosition *position = [self.textVDesc positionFromPosition:selectedRange.start offset:0];
        
        //没有高亮状态，即每次截取要在文字确认之后
        if (!position) {
            
            if (self.textVDesc.text.length > Max_Num_TextView) {
                self.textVDesc.text = [self.textVDesc.text substringToIndex:Max_Num_TextView];
                self.isNameTextFieldEnbable = NO;
            }
        }
    }
    //非汉字状态
    else{
        if (self.textVDesc.text.length > Max_Num_TextView) {
            self.textVDesc.text = [self.textVDesc.text substringToIndex:Max_Num_TextView];
            self.isNameTextFieldEnbable = NO;
        }
    }
    
    _labMaxLength.text = [NSString stringWithFormat:@"%ld字",Max_Num_TextView - _textVDesc.text.length];
}


@end
