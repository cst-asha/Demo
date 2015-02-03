//
//  ViewController.m
//  Demo
//
//  Created by fab3 on 06/01/15.
//  Copyright (c) 2015 sunny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrWorks = [[NSMutableArray alloc]init];
    arrService = [[NSMutableArray alloc]init];
    arrGoods = [[NSMutableArray alloc]init];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;{
    if (section ==0) {
        return arrWorks.count;
    }
    else if (section==1){
        return arrService.count;
    }
    else{
        return arrGoods.count;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 35)];
    
    UILabel *lblTitle =[[UILabel alloc]init];
    if (section==0) {
        [lblTitle setText:@"Works"];
    }
    else if (section==1) {
        [lblTitle setText:@"Service"];
    }
    else {
        [lblTitle setText:@"Goods"];
    }
    [lblTitle setFrame:CGRectMake(20, 0, 320, 35)];
    [headerView addSubview:lblTitle];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:headerView.frame];
    btn.tag = section;
    [btn addTarget:self action:@selector(btnSectionClicked:) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:btn];
    
    [headerView setBackgroundColor:[UIColor darkGrayColor]];
    
    return headerView;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section==0) {
        cell.textLabel.text = [arrWorks objectAtIndex:indexPath.row];
    }
    else if (indexPath.section==1){
        cell.textLabel.text = [arrService objectAtIndex:indexPath.row];
    }
    else{
        cell.textLabel.text = [arrGoods objectAtIndex:indexPath.row];
    }
    return cell;
    
}

-(void)btnSectionClicked:(UIButton *)sender{
    [arrGoods removeAllObjects];
    [arrService removeAllObjects];
    [arrWorks removeAllObjects];
    if(sender.tag==0){
        arrWorks = [self getWorks];
    }
    else if (sender.tag==1){
        arrService = [self getService];
    }
    else{
        arrGoods = [self getGoods];
    }
    
    [tblView reloadData];
    
}
-(NSMutableArray *)getService{
    
    NSMutableArray *arr =[[NSMutableArray alloc]initWithObjects:@"Service 1",@"Service 2", nil];
    return arr;
}
-(NSMutableArray *)getGoods{
    
    NSMutableArray *arr =[[NSMutableArray alloc]initWithObjects:@"Goods 1",@"Goods 2", nil];
    return arr;
}
-(NSMutableArray *)getWorks{
    
    NSMutableArray *arr =[[NSMutableArray alloc]initWithObjects:@"Works 1",@"Works 2", nil];
    return arr;
}
@end
