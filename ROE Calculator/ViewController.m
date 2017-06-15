//
//  ViewController.m
//  ROE Calculator
//
//  Created by Suguru on 6/9/17.
//  Copyright © 2017 Suguru. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//UI components
@property (weak, nonatomic) IBOutlet UITextField *netIncomeTextField;
@property (weak, nonatomic) IBOutlet UITextField *revenueTextField;
@property (weak, nonatomic) IBOutlet UITextField *assetsTextField;
@property (weak, nonatomic) IBOutlet UITextField *equityTextField;
@property (weak, nonatomic) IBOutlet UITextField *profitMarginTextField;
@property (weak, nonatomic) IBOutlet UITextField *assetTurnoverTextField;
@property (weak, nonatomic) IBOutlet UITextField *avgTotalAssetsTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalCapitalTextField;
@property (weak, nonatomic) IBOutlet UITextField *dividendsTextField;
@property (weak, nonatomic) IBOutlet UITextField *leverageFactorTextField;
@property (weak, nonatomic) IBOutlet UITextField *roeTextField;
@property (weak, nonatomic) IBOutlet UITextField *roicTextField;
@property (weak, nonatomic) IBOutlet UITextField *roaTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorMsgTextField;

@property double netIncome;
@property double revenue;
@property double assets;
@property double equity;
@property double avgTotalAssets;
@property double totalCapital;
@property double dividends;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _profitMarginTextField.userInteractionEnabled = NO;
    _assetTurnoverTextField.userInteractionEnabled = NO;
    _leverageFactorTextField.userInteractionEnabled = NO;
    _roeTextField.userInteractionEnabled = NO;
    _roicTextField.userInteractionEnabled = NO;
    _roaTextField.userInteractionEnabled = NO;
    
    [_netIncomeTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_revenueTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_assetsTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_equityTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_avgTotalAssetsTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_totalCapitalTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_dividendsTextField setKeyboardType:UIKeyboardTypeNumberPad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)calculate:(id)sender {
    
    if (![_netIncomeTextField.text isEqualToString:@""] && ![_revenueTextField.text isEqualToString:@""] && ![_assetsTextField.text isEqualToString:@""] && ![_equityTextField.text isEqualToString:@""] && ![_avgTotalAssetsTextField.text isEqualToString:@""] && ![_totalCapitalTextField.text isEqualToString:@""] && ![_dividendsTextField.text isEqualToString:@""]) {
        
        _errorMsgTextField.text = @"";
        
        _netIncome = [_netIncomeTextField.text doubleValue];
        _revenue = [_revenueTextField.text doubleValue];
        _assets = [_assetsTextField.text doubleValue];
        _equity = [_equityTextField.text doubleValue];
        _avgTotalAssets = [_avgTotalAssetsTextField.text doubleValue];
        _totalCapital = [_totalCapitalTextField.text doubleValue];
        _dividends = [_dividendsTextField.text doubleValue];
        
        _profitMarginTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:_netIncome/_revenue * 100.0] doubleValue]];
        _assetTurnoverTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:_revenue/_assets * 100.0] doubleValue]];
        _leverageFactorTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:_assets/_equity * 100.0] doubleValue]];
        _roeTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:_netIncome/_equity * 100.0]  doubleValue]];
        //net income - dividends / total capital
        _roicTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:(_netIncome - _dividends)/_totalCapital * 100.0]  doubleValue]];
        //return on assets ratio = net income / average total assets
        _roaTextField.text = [NSString stringWithFormat:@"%.2f%%", [[NSNumber numberWithDouble:_netIncome/_avgTotalAssets * 100.0]  doubleValue]];
    } else {
        _errorMsgTextField.text = @"Fill in all blalnks";
    }
}

- (IBAction)clear:(id)sender {
    _netIncomeTextField.text = @"";
    _revenueTextField.text = @"";
    _assetsTextField.text = @"";
    _avgTotalAssetsTextField.text = @"";
    _totalCapitalTextField.text = @"";
    _dividendsTextField.text = @"";
    _equityTextField.text = @"";
    _profitMarginTextField.text = @"";
    _assetTurnoverTextField.text = @"";
    _leverageFactorTextField.text = @"";
    _roeTextField.text = @"";
    _roicTextField.text = @"";
    _roaTextField.text = @"";
    _errorMsgTextField.text = @"";
}



@end
