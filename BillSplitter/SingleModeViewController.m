//
//  SingleModeViewController.m
//  BillSplitter
//
//  Created by Calvin Nisbet on 2014-11-27.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "SingleModeViewController.h"

@interface SingleModeViewController () <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *mealPriceTextField;

@property (strong, nonatomic) IBOutlet UILabel *tipPercentageLabel;

@property (strong, nonatomic) IBOutlet UISlider *tipPercentageSlider;

@property (strong, nonatomic) IBOutlet UIButton *totalPriceButton;

@property (strong, nonatomic) IBOutlet UILabel *totalPriceLabel;

-(void)mealPrice;

@end

@implementation SingleModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tipPercentageSlider:(id)sender
{
    NSInteger val = lround(_tipPercentageSlider.value);
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%d", val];
}

-(void)mealPrice
{
    float tipPercentage = self.tipPercentageSlider.value/100;
    
    
    float mealCost = [self.mealPriceTextField.text floatValue];
    
    float mealTip = mealCost * mealCost;
    float myCost = mealTip + mealCost;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f", myCost];
    NSLog(@"%f", myCost);
}

-(IBAction)mealCost:(id)sender
{
    [self mealPrice];
}

@end
