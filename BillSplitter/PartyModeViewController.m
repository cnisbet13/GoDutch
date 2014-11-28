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
    self.guestsLabel.text = [NSString stringWithFormat:@"%d", guestValue];
}


- (IBAction)tipPercentageSliderValueChanged:(id)sender
{
    NSInteger tipValue = lround(_tipPercentageSlider.value);
    self.tipPercentageLabel.text = [NSString stringWithFormat:@"%d", tipValue];
}

#pragma mark - Methods

-(void)priceForMeal
{
    
    //Cost of meal as entered into the label - check
    float totalCostOfMeal = [self.mealPriceTextField.text floatValue];
    
    
    //converting the value of the slider into an integer - check.
    NSInteger guestsValue = lround(_guestsSlider.value);
    
    //converting the value of the slider into an integer - check.
    NSInteger tipValue = lround(_tipPercentageSlider.value);
    
    //not getting called - what I am trying to do is take the tipvalue from above and divide it by 10 or 100.
    //Why might it not be working?
    int tipCost = tipValue/10;
    
    //taking the meal cost and dividing by the number of people.
    float individualCostOfMeal = totalCostOfMeal / guestsValue;
  
    //taking the result from the two above and
    float totalMeal = tipCost + individualCostOfMeal;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"$%f",totalMeal];
    NSLog(@"%f",totalMeal);
}



- (IBAction)priceButton:(id)sender
{
    [self priceForMeal];
}


@end
