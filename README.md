# TestUISwitchNotDealloc
UISwitchNotDeallocIniOS10.1


an UISwitch instance will never dealloc in iOS10.1

because there is a inner retain cycle.

see [this article](http://www.jianshu.com/p/7c8ceabda915).
