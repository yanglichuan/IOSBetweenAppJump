应用程序互相跳转

1. 应用场景

1） 使用第三方用户登录，需要用户授权，还需要"返回到调用的程序，同时返回授权的用户名"

2） 应用程序推广，网易彩票，设置－推荐应用－有很多应用程序图标
－如果本机已经安装过，会直接跳转到另外一个应用程序
－软件的广告，推广结果，后续会有一些列的金钱上的结算

3)	支付宝，第三方支付，淘宝，电话费充值。。。

2. 要打开本机上的其他应用程序，需要设置schemes，自定义的协议头，可以打开其他的应用程序

跳转的代码如下：

- (IBAction)openWangyi:(id)sender
{
    // 跳转到其他应用程序
    // schemes: 网易的scheme wangyi
    NSURL *url = [NSURL URLWithString:@"wangyi://view?newsid=201410130001"];
    
    // 判断本机是否安装了目标程序
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    } else {
        NSLog(@"没有安装，可以再给定下载地址，前往");
    }
}

3. 新浪微博的授权界面说明：

1>	在新浪微博中，本身不能直接跳转到该界面
2> 用其他应用程序打开时，如果scheme时weibo://oaauth，直接进入此界面
3> 如果直接点击，返回，返回调用放应用程序
4> 如果点击表格行中的用户名，直接返回用户信息给调用应用程序


4. 如果要返回调用的应用程序，需要知道调用我们的应用程序的scheme


/** 只要是由其他应用程序打开的，就会调用此方法 */
/** URL 就是其他应用程序，打开当前程序使用的URL */
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url

/**
 openURL 是打开当前应用程序的url
 sourceApplication 是当开当前应用程序的源程序的BundleId
 
 提示：一旦重写了新方法，旧方法就不再被执行
 但是：很多第三方框架，都建议两个方法全都写
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation