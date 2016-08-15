> ## CRPopListView
>
## 一、功能介绍
#####1. 点击弹出下拉列表框，常见、易用、易扩展。
#####2. CRPopListView初始化极其简单，只要实例化并附带按钮标题及列表数据数组即可。
#####3. 按钮点击分别下拉弹出列表和上拉收起列表，按钮状态图片随之改变。
#####4. 选中列表选项，按钮标题改变，列表自动隐藏。
#####5. 已设置手势，当列表显示在页面上时，点击空白处均可以隐藏列表并改变按钮状态。
## 二、使用方法
#####1. 在需要的地方import文件"CRPopListView.h"
#####2.     NSArray *items = @[
                       @"内容1",
                       @"内容2",
                       @"内容3",
                       @"内容4",
                       @"内容5",
                       @"内容6"
                       ];
    CGRect frame = CGRectMake(30, 100, self.view.frame.size.width-60, 40);
    CRPopListView *view = [[CRPopListView alloc] initWithFrame:frame title:@"这是标题" items:items];
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
