//
//  L_EditHeaderViewController.m
//  yuehui
//
//  Created by luhongyu on 17/5/18.
//  Copyright © 2017年 luhongyu. All rights reserved.
//

#import "L_EditHeaderViewController.h"

@interface L_EditHeaderViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageViewheader;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation L_EditHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cancelBtn.layer.borderWidth = 1;
    _cancelBtn.layer.borderColor = RGBColor(226, 226, 226).CGColor;
    
    [_imageViewheader sd_setImageWithURL:[NSURL URLWithString:@"http://ww1.sinaimg.cn/bmiddle/6a74b92bjw1eskajlfzdxj206x08t3yy.jpg"]];
}

- (IBAction)editBtnClick:(id)sender {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"选择拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
        }else{
            [SVProgressHUD showImage:nil status:@"请在设置中打开相机权限"];
        }
        
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        [self presentViewController:pickerImage animated:YES completion:^{
            
        }];
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        }else{
            [SVProgressHUD showImage:nil status:@"请在设置中打开相册权限"];
        }
        
        pickerImage.delegate = self;
        pickerImage.allowsEditing = NO;
        [self presentViewController:pickerImage animated:YES completion:^{
            
        }];
        
    }]];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)cancelBtnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    if ([info[@"UIImagePickerControllerMediaType"] isEqualToString:@"public.image"])
    {
        UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            [self uploadImage:image];
            
        }];
    }else{
        [SVProgressHUD showImage:nil status:@"暂不支持此格式"];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }
}

- (void)uploadImage:(UIImage *)image{
    
    
}



@end
