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
