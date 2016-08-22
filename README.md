> ## CRPopListView
>
![gif](http://pan.baidu.com/disk/home?fr=ibaidu&errno=0&errmsg=Auth%20Login%20Sucess&stoken=422298a63c28883f92c59b762939fc3c8dd0433b57f584680678b4efff09d873520bd5730504d701f486ea2651d7f4061d61bdf23623930c4dc62ca6ee13476965ebc7decefa&bduss=a89d7f0d36a8c742657584dacb6e8c13025eec1407088d64d39bb24556b5d96f1577c193681cb9676ea130f5b234525628adfedaed44096b5f47f9a752a1121404510035455c47100da63fc5e6625a88c07f8e3fc37636b45a01522935dd22b41d773f523db17e4e55f4b9b3f8c9f1d87c5bd6cc5473678e5db4f459277300d96f1221693500d2aad9b4d034924b1cea44720b551f522bd7160652a38e6b4a851640396f9e93d02424b8674f7c55035c9d5fb8499eb3a456631d86125393c66fa419c7884c5b&ssnerror=0#list/path=%2F%E6%8A%80%E6%9C%AF%E5%9B%BE%E7%89%87)
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
#####3. 输出CRPopListView选中行：view.selectedIndex, 选中字符串：view.result.
