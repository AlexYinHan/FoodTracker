# FoodTracker
Apple Developer 上的学习材料,使用Xcode9和Swift3制作一个可以存储食谱的app.<br />
[Start Developing iOS Apps(Swift)](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1)<br />
用于个人学习记录。 <br />
实际学习途中切换成了Xcode10和Swift4.<br />
## 可能出现的问题及解决方法
 - 在设备上白屏的解决方法：product -> clean. [stackoverflow-abort with payload](https://stackoverflow.com/questions/41549131/dyld-abort-with-payload-error-on-iphone-5s-device)<br />
 - 如果有警告："All interface orientations must be supported unless the app requires full screen." [参考这个问题](https://stackoverflow.com/questions/31141806/xcode-7-beta-warnings-interface-orientations-and-launch-storyboard)

# iOS学习笔记
1. **GCD队列的优先级**<br>
iOS上：[Energy Efficiency Guide for iOS Apps - Prioritize Work with Quality of Service Classes](https://developer.apple.com/library/content/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html#//apple_ref/doc/uid/TP40015243-CH39-SW1)<br>
对于Mac上的说明跟iOS的基本一致：[Energy Efficiency Guide for Mac Apps - Prioritize Work at the Task Level](https://developer.apple.com/library/content/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/PrioritizeWorkAtTheTaskLevel.html#//apple_ref/doc/uid/TP40013929-CH35-SW1)
***
2. **Main Thread Checker**<br>
在启动app时（at app launch），自动将只能在主线程上运行的代码替换成带有检查（check）的版本，如果是在主线程上，就不会进入这个判断语句块。<br>
在下载图片的例子中，如果在completionHandler中，也就是在非主线程中更新imageView，会在终端输出调试信息，一段时间后才会显示图片。<br>
所以，自动加的这个check里面，应该就只是一些负责输出信息的代码，这个操作还是会进行，程序也不会崩溃，只是交互不太及时。<br>
运行一个macOS app，只要有动态库文件/Applications/Xcode.app/Contents/Developer/usr/lib/libMainThreadChecker.dylib就行，不需要重新编译程序。<br>
占用资源很少，所以Xcode上一般自动开启主线程检查。
***
3. **Operation**<br>
 - **NSInvocationOperation & BlockOperation**<br>
Operation是一个抽象类，不能直接使用。<br>
NSInvocationOperation使用 selector 回调并可以传递参数进去，BlockInvocation是使用 Block。如果想要使用多线程异步操作，则应该选择   NSBlockOperation。<br>
事实上，NSInvocationOperation在swift中是不可用的。<br>
 - **OperationQueue**<br>
被cancel的operation，依赖于它的所有operation都会被cancel；如果被cancel的这个operation已经开始了，则会继续运行下去，但是‘isCancelled’还是会变为true。
***
4. **NavigationBar不显示**<br>
如果当前View的NavigationController没有入口，则编译器会警告，并且对应的NavigationBar就（可能）不会显示。<br>
至少要有一个segue指向NavigationController，可以通过它的topViewController来访问对应的view。
***
5. **performSegueWithIdentifier 不跳转**<br>
[iOS 开发中手动 performSegueWithIdentifier 不生效的解决办法](https://lvwenhan.com/ios/424.html)
> iOS 视图控制对象的生命周期如下：<br>
init－初始化程序<br>
viewDidLoad－加载视图<br>
viewWillAppear－UIViewController对象的视图即将加入窗口时调用；<br>
viewDidApper－UIViewController对象的视图已经加入到窗口时调用；<br>
viewWillDisappear－UIViewController对象的视图即将消失、被覆盖或是隐藏时调用；<br>
viewDidDisappear－UIViewController对象的视图已经消失、被覆盖或是隐藏时调用；<br>
viewVillUnload－当内存过低时，需要释放一些不需要使用的视图时，即将释放时调用；<br>
viewDidUnload－当内存过低，释放一些不需要的视图时调用。<br>

如果在 viewDidLoad 时就启动 Segue 的话，依然会被后来填充的视图覆盖，要在视图载入完成以后的 viewDidAppear 中启动 Segue.
***
6. **Any类型**<br>
待解决<br>
***
7. **json数据**<br>
未解决<br>
将字典类型转为json类型，作为post的参数<br>
发送{roomid:1001}<br>
变成{'{\n "roomId" : 1001\n}': ''}<br>
***
8. **OperationQueue中的operation无法取消**
其实该operation的isCancelled已经为true，但是不知道什么原因还在运行。<br>
在取消后手动记录下取消状态，在operation中检查这个值，手动终止该任务。<br>
***
