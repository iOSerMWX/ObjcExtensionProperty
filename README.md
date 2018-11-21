# ObjcExtensionProperty

[![CI Status](https://img.shields.io/travis/zxllf23@163.com/ObjcExtensionProperty.svg?style=flat)](https://travis-ci.org/zxllf23@163.com/ObjcExtensionProperty)
[![Version](https://img.shields.io/cocoapods/v/ObjcExtensionProperty.svg?style=flat)](https://cocoapods.org/pods/ObjcExtensionProperty)
[![License](https://img.shields.io/cocoapods/l/ObjcExtensionProperty.svg?style=flat)](https://cocoapods.org/pods/ObjcExtensionProperty)
[![Platform](https://img.shields.io/cocoapods/p/ObjcExtensionProperty.svg?style=flat)](https://cocoapods.org/pods/ObjcExtensionProperty)

## Overview
[ObjcExtensionProperty](https://github.com/Roen-Ro/ObjcExtensionProperty) is a collection of macro defines for adding getter and setter methods for objective-c calsses and extensions. 
- Fast adding getter/setter methods with just one line code
- Add weak properties for calss extension (also with just one line code)
- Easy to add lazy property getter method with just one line code


## Example

### Add various kinds of properties for class extension
Let see how easy it is to add various kinds of properties though [ObjcExtensionProperty](https://github.com/Roen-Ro/ObjcExtensionProperty). In this example we assume that you want to add some properties for `UIView`

```objc
//UIView+DyanmicTest.h

@interface UIView (DyanmicTest)

@property (nonatomic, strong) NSString *dynProperty; //common object property
@property (nonatomic) int dynPrimitiveValue; //primitive type property
@property (nonatomic, weak) NSString *dynWeakProperty; //weak property
@property (nonatomic, lazy) NSString *lazyProperty; //lazy proper

@end
```
add backed getter/setter methods for properties in .m file 
```objc
//UIView+DyanmicTest.m
@implementation UIView (DyanmicTest)

//common getter/setter
__SETTER(dynProperty, setDynProperty, OBJC_ASSOCIATION_RETAIN)
__GETTER(NSString, dynProperty)

//primitive type getter/setter
__SETTER_PRIMITIVE(int,dynPrimitiveValue, setDynPrimitiveValue, numberWithInt:)
__GETTER_PRIMITIVE(int, dynPrimitiveValue, intValue)

//weak reference getter/setter
__SETTER_WEAK(dynWeakProperty, setDynWeakProperty)
__GETTER_WEAK(NSString, dynWeakProperty)

//lazy property getter
__GETTER_LAZY(NSString, lazyProperty,[NSString stringWithFormat:@"lazy created on %@",[NSDate date]])

@end
```
Without [ObjcExtensionProperty](https://github.com/Roen-Ro/ObjcExtensionProperty), you'll find that implementing these getter/setter methods is cumbersome, you will have to write much more code. especially for lazy properties.

```objc
//UIView+DyanmicTest.m

@implementation UIView (DyanmicTest)

//lazyProperty's getter method without ObjcExtensionProperty

//define a key
const char lazyPropertyKey;
// implement the getter
-(NSString *)lazyProperty{
    NSString *retValue =  objc_getAssociatedObject(self, &lazyPropertyKey);
    if(!retValue) {
        retValue = [NSString stringWithFormat:@"lazy created on %@",[NSDate date]];
        objc_setAssociatedObject(self, &lazyPropertyKey, retValue, OBJC_ASSOCIATION_RETAIN);
    }
    return retValue;
}
.

//other properties getter/setter methods
.
.
.
.

@end
```

### Add weak property for class extension
`objc_setAssociatedObject()` doesn't provide a weak reference type, but instead with OBJC_ASSOCIATION_ASSIGN, which means whenever you access to a object that was previousely deallocated, you will cetainly got a crash. with [ObjcExtensionProperty](https://github.com/Roen-Ro/ObjcExtensionProperty) you don't have to face such a problem anymore.

```objc

//define weak property in extension's .h file
@property (nonatomic, weak) NSString *dynWeakProperty; //weak property

//implement weak property's getter/setter methods
__SETTER_WEAK(dynWeakProperty, setDynWeakProperty)
__GETTER_WEAK(NSString, dynWeakProperty)

```

### Add lazy property's getter method
[ObjcExtensionProperty](https://github.com/Roen-Ro/ObjcExtensionProperty) can easy to add getter method for lazy properties both for ivar backed properties(through `__GETTER_LAZY_IVAR()`) and in calss extensions(through `__GETTER_LAZY`)

lazy getter method for ivar backed property
```objc

//define lazy property
@interface RRViewController ()
@property (nonatomic,lazy) HttpClient *client;
@end

//
@implementation RRViewController
{
    HttpClient *_client;
}

//lazy getter method for self.client
__GETTER_LAZY_IVAR(HttpClient, client, [[HttpClient alloc]initWithUrl:@"https://github.com/Roen-Ro"])

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"log _client.url:%@",_client.url); //null 
    NSLog(@"log self.client.url:%@",self.client.url); //https://github.com/Roen-Ro
}

//....
@end

```

## Requirements 
ios 5.0, mac os 9.0

## Installation

ObjcExtensionProperty is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ObjcExtensionProperty'
```

## Author

Roen(罗亮富), zxllf23@163.com

## License

ObjcExtensionProperty is available under the MIT license. See the LICENSE file for more info.
