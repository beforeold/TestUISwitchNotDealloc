# TestUISwitchNotDealloc
UISwitchNotDeallocIniOS10.1


an UISwitch instance will never dealloc in iOS10.1

because there is a inner retain cycle.

see [[iOS][OC] 内存泄漏检查的意外发现：在iOS10下UISwitch自身不释放的bug](http://www.jianshu.com/p/7c8ceabda915).


# 背景
公司新的项目告一段落开始进行优化，进行一次内存泄漏的检查
使用的是由[腾讯微信阅读团队](http://wereadteam.github.io/2016/07/20/MLeaksFinder2/)开源的[MLeaksFinder](https://github.com/Zepo/MLeaksFinder/)工具，可以在调试阶段即时地发现项目中内存泄漏的情况，主要面向OC对象未释放的问题

# 发现UISwitch问题
在一个业务```ViewController```显示```UISwitch```未释放的问题，经过多次检查和排除后均未找到原因，开始怀疑```MleaksFinder```的准确性时，通过自定义一个```UISwitch```的子类重写```dealloc```方法来确认，发现使用确实未调用```dealloc```方法。

接着从网上找到一个可靠的解释，来自```RxSwift```一个[issue](https://github.com/ReactiveX/RxSwift/issues/842)的回答，说明使用Instruments-Leaks工具找出了UISwitch内部属性retain了UISwitch造成的循环引用，如下图：
![](https://cloud.githubusercontent.com/assets/63070/17834158/07ef484c-6734-11e6-93db-71c8f893b913.jpg)
![](https://cloud.githubusercontent.com/assets/63070/17834159/09fd465c-6734-11e6-8919-1f0a3b650c7a.jpg)
此外实测iOS9和iOS8下可顺利释放。
 这显然是UIKit自身的bug，已经有老司机上报了。

感谢一起调试的Alan和Luffy小伙伴

# demo
[demo 地址](https://github.com/beforeold/TestUISwitchNotDealloc)
