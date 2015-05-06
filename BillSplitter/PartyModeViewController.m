//
//  ViewController.m
//  BillSplitter
//
//  Created by Calvin Nisbet on 2014-10-20.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "PartyModeViewController.h"

@interface PartyModeViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *mealPriceTextField;
@property (strong, nonatomic) IBOutlet UILabel *guestsLabel;
@property (strong, nonatomic) IBOutlet UISlider *guestsSlider;
@property (strong, nonatomic) IBOutlet UILabel *tipPercentageLabel;
@property (strong, nonatomic) IBOutlet UISlider *tipPercentageSlider;
@property (strong, nonatomic) IBOutlet UIButton *totalPriceButton;
@property (strong, nonatomic) IBOutlet UILabel *totalPriceLabel;

@end

@implementation PartyModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Slider Methods
- (IBAction)guestSliderValueChanged:(id)sender
{
    NSInteger guestValue = lround(_guestsSlider.value);
    self.guestsLabel.text = [NSString stringWithFormat:@"%ld", (long)guestValue];
}


- (IBAction)tipPercentageSliderValueChanged:(id)sender
{
    NSInteger tipValue = lround(_tipPercentageSlider.value);
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%d", (int)tipValue];
}

#pragma mark - Methods

-(void)priceForMeal
{
    
    //Cost of meal as entered into the label - check
    float totalCostOfMeal = [self.mealPriceTextField.text floatValue];
    
    
    //converting the value of the slider into an integer - check.
    NSInteger guestsValue = lround(_guestsSlider.value);
    
    //converting the value of the slider into an integer - check.
    float tipValue = lround(_tipPercentageSlider.value);
    
    NSLog(@"tipValue is %ld", (long)tipValue);
    
    //not getting called - what I am trying to do is take the tipvalue from above and divide it by 10 or 100.
    //Why might it not be working?
    float tipCost = tipValue / 100;
    
    NSLog(@"tipCost is %f", tipCost);
    
    //taking the meal cost and dividing by the number of people.
    float individualMeal = totalCostOfMeal / guestsValue;
    
    //taking the result from the two above and
    float mealTax = tipCost * individualMeal;
    float totalMeal = mealTax + individualMeal;
    
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%.2f",totalMeal];
    NSLog(@"%.2f",totalMeal);
}



- (IBAction)priceButton:(id)sender
{
    [self priceForMeal];
}


@end
