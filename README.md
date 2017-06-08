# PSRouter

PSRouter is a good way to realise slide transition between Controller, it is fit for MVVM. you don't need to import controller head file, just register it in AppDelegate. 

## Podfile
```
target 'TargetName' do
pod 'PSRouter'
end
```
## register Controller in didFinishLaunchingWithOptions
```
[[PSRouter shareInstance] registerClass:[ViewController class] protocol:@protocol(protocol)];
```
 ## Parameters
 you should use protocol to pass parameters
 ```
@protocol protocol<NSObject>
@property (nonatomic, strong) id para;
、、、
@end
```
the registered controller should conforms to protocol which is registered in PSRouter
```
@interface ViewController ()<protocol>
@end
@implementation ViewController
@synthesize para = _para;
@end
```
## push or present Controller
present style pass YES to isModel
```
[[PSRouter shareInstance] openScheme:<#(nonnull Protocol *)#> property:<#^(id  _Nullable x)property#> isModel:<#(BOOL)#>]
```
Default is push stype
```
[[PSRouter shareInstance] openScheme:@protocol(protocol) property:^(id<protocol>target) {
        target.buttonTitle = @"Sectond";
    }];
 ```
