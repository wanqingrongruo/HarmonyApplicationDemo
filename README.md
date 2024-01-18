# HarmonyApplicationDemo
harmony learn demo

## 项目目录
https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667303102887820


## 状态管理
组件状态管理装饰器和@Builder装饰器：

组件状态管理装饰器用来管理组件中的状态，它们分别是：@State、@Prop、@Link。

@State装饰的变量是组件内部的状态数据，当这些状态数据被修改时，将会调用所在组件的build方法进行UI刷新。
@Prop与@State有相同的语义，但初始化方式不同。@Prop装饰的变量必须使用其父组件提供的@State变量进行初始化，允许组件内部修改@Prop变量，但更改不会通知给父组件，即@Prop属于单向数据绑定。
@Link装饰的变量可以和父组件的@State变量建立双向数据绑定，需要注意的是：@Link变量不能在组件内部进行初始化。
@Builder装饰的方法用于定义组件的声明式UI描述，在一个自定义组件内快速生成多个布局内容。
@State、@Prop、@Link三者关系如图所示：
https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyManage/011/111/111/0000000000011111111.20230218100026.08664392171777894827837635761359:50001231000000:2800:651B4C40F8EEFBB2E58E6700E995054DC851E0D5C1319FD926718CED1817430F.png?needInitFileName=true


## 生命周期
组件生命周期函数：

自定义组件的生命周期函数用于通知用户该自定义组件的生命周期，这些回调函数是私有的，在运行时由开发框架在特定的时间进行调用，不能从应用程序中手动调用这些回调函数。 右图是自定义组件生命周期的简化图示：


需要注意的是，部分生命周期回调函数仅对@Entry修饰的自定义组件生效，它们分别是：onPageShow、onPageHide、onBackPress


## 应用程序入口-UIAbility
系统调用的单元, 为应用提供窗口在其中绘制界面

建议将一个独立的模块放到一个 UIAbility 中, 以多页面的形式呈现

UIAbility内页面的跳转和数据传递:
UIAbility的数据传递包括有UIAbility内页面的跳转和数据传递、UIAbility间的数据跳转和数据传递，本章节主要讲解UIAbility内页面的跳转和数据传递

页面跳转的几种方式，根据需要选择一种方式跳转即可。
方式一：API9及以上，router.pushUrl()方法新增了mode参数，可以将mode参数配置为router.RouterMode.Single单实例模式和router.RouterMode.Standard多实例模式。
在单实例模式下：如果目标页面的url在页面栈中已经存在同url页面，离栈顶最近同url页面会被移动到栈顶，移动后的页面为新建页，原来的页面仍然存在栈中，页面栈的元素数量不变；如果目标页面的url在页面栈中不存在同url页面，按多实例模式跳转，页面栈的元素数量会加1。
说明
当页面栈的元素数量较大或者超过32时，可以通过调用router.clear()方法清除页面栈中的所有历史页面，仅保留当前页面作为栈顶页面。

mode 默认值是: router.RouterMode.Standard

方式二：API9及以上，router.replaceUrl()方法新增了mode参数，可以将mode参数配置为router.RouterMode.Single单实例模式和router.RouterMode.Standard多实例模式。
在单实例模式下：如果目标页面的url在页面栈中已经存在同url页面，离栈顶最近同url页面会被移动到栈顶，替换当前页面，并销毁被替换的当前页面，移动后的页面为新建页，页面栈的元素数量会减1；如果目标页面的url在页面栈中不存在同url页面，按多实例模式跳转，页面栈的元素数量不变

/*
 router.pushUrl({
              url: 'pages/SecondPage',
              params: {
                src: msg
              }
            })
*/

// router.back()
调用router.back()返回的目标页面需要在页面栈中存在才能正常跳转。
例如调用router.pushUrl()方法跳转到Second页面，在Second页面可以通过调用router.back()方法返回到上一个页面。
例如调用router.clear()方法清空了页面栈中所有历史页面，仅保留当前页面，此时则无法通过调用router.back()方法返回到上一个页面。

// 返回指定页面
router.back({ url: 'pages/Index' });

页面返回可以根据业务需要增加一个询问对话框。
router.enableBackPageAlert({
  message: 'Message Info'
});

router.back();

说明
router.enableBackPageAlert()方法开启页面返回询问对话框功能，只针对当前页面生效。例如在调用router.pushUrl()或者router.replaceUrl()方法，跳转后的页面均为新建页面，因此在页面返回之前均需要先调用router.enableBackPageAlert()方法之后，页面返回询问对话框功能才会生效。
如需关闭页面返回询问对话框功能，可以通过调用router.disableAlertBeforeBackPage()方法关闭该功能即可。

// router.back(); 可以携带参数
 router.back({
              url: 'pages/Index',
              params: {
                src: 'Second 页面传来的数据'
              }
            });

调用router.back()方法，不会新建页面，返回的是原来的页面，在原来页面中@State声明的变量不会重复声明，以及也不会触发页面的aboutToAppear()生命周期回调，因此无法直接在变量声明以及页面的aboutToAppear()生命周期回调中接收和解析router.back()传递过来的自定义参数。


UIAbility 的生命周期: 
https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20240111104611.62380710544436394220899882857513:50001231000000:2800:DADBD0D5AC8A3C3654AD72AA6C0BFE390CAFDD114A6681DACF6E8728F424A39D.png?needInitFileName=true?needInitFileName=true

onWindowStageCreate 和 onWindowStageDestroy 不是状态函数

1. Create状态，在UIAbility实例创建时触发，系统会调用onCreate回调。可以在onCreate回调中进行相关初始化操作例如用户打开电池管理应用，在应用加载过程中，在UI页面可见之前，可以在onCreate回调中读取当前系统的电量情况，用于后续的UI页面展示
2. UIAbility实例创建完成之后，在进入Foreground之前，系统会创建一个WindowStage。每一个UIAbility实例都对应持有一个WindowStage实例。
WindowStage为本地窗口管理器，用于管理窗口相关的内容，例如与界面相关的获焦/失焦、可见/不可见。
可以在onWindowStageCreate回调中，设置UI页面加载、设置WindowStage的事件订阅
在onWindowStageCreate(windowStage)中通过loadContent接口设置应用要加载的页面
Window接口的使用详见窗口开发指导https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101667310940295021。
3. Foreground和Background状态，分别在UIAbility切换至前台或者切换至后台时触发。
分别对应于onForeground回调和onBackground回调。
onForeground回调，在UIAbility的UI页面可见之前，即UIAbility切换至前台时触发。可以在onForeground回调中申请系统需要的资源，或者重新申请在onBackground中释放的资源。
onBackground回调，在UIAbility的UI页面完全不可见之后，即UIAbility切换至后台时候触发。可以在onBackground回调中释放UI页面不可见时无用的资源，或者在此回调中执行较为耗时的操作，例如状态保存等。
4. 对应于onWindowStageCreate回调。在UIAbility实例销毁之前，则会先进入onWindowStageDestroy回调，我们可以在该回调中释放UI页面资源
5. Destroy状态，在UIAbility销毁时触发。可以在onDestroy回调中进行系统资源的释放、数据的保存等操作
例如用户使用应用的程序退出功能，会调用UIAbilityContext的terminalSelf()方法，从而完成UIAbility销毁。或者用户使用最近任务列表关闭该UIAbility实例时，也会完成UIAbility的销毁


UIAbility 的启动模式

UIAbility当前支持singleton（单实例模式）、multiton（多实例模式）和specified（指定实例模式）3种启动模式。

singleton（单实例模式）
singleton启动模式为单实例模式，也是默认情况下的启动模式。
每次调用startAbility()方法时，如果应用进程中该类型的UIAbility实例已经存在，则复用系统中的UIAbility实例。系统中只存在唯一一个该UIAbility实例，即在最近任务列表中只存在一个该类型的UIAbility实例

应用的UIAbility实例已创建，该UIAbility配置为单实例模式，再次调用startAbility()方法启动该UIAbility实例。由于启动的还是原来的UIAbility实例，并未重新创建一个新的UIAbility实例，此时只会进入该UIAbility的onNewWant()回调，不会进入其onCreate()和onWindowStageCreate()生命周期回调。


singleton启动模式的开发使用，在module.json5文件中的“launchType”字段配置为“singleton”即可。

{
   "module": {
     // ...
     "abilities": [
       {
         "launchType": "singleton",
         // ...
       }
     ]
  }
}

multiton（多实例模式）
multiton启动模式为多实例模式，每次调用startAbility()方法时，都会在应用进程中创建一个新的该类型UIAbility实例。即在最近任务列表中可以看到有多个该类型的UIAbility实例。这种情况下可以将UIAbility配置为multiton（多实例模式）

multiton启动模式的开发使用，在module.json5配置文件中的launchType字段配置为multiton即可。
{
   "module": {
     // ...
     "abilities": [
       {
         "launchType": "multiton",
         // ...
       }
     ]
  }
}

specified（指定实例模式）
specified启动模式为指定实例模式，针对一些特殊场景使用（例如文档应用中每次新建文档希望都能新建一个文档实例，重复打开一个已保存的文档希望打开的都是同一个文档实例

例如有两个UIAbility：EntryAbility和SpecifiedAbility，SpecifiedAbility配置为指定实例模式启动，需要从EntryAbility的页面中启动SpecifiedAbility。
a. 在SpecifiedAbility中，将module.json5配置文件的launchType字段配置为specified。
{
  "module": {
    // ...
    "abilities": [
      {
        "launchType": "specified",
        // ...
      }
    ]
  }
}

b. 在创建UIAbility实例之前，开发者可以为该实例指定一个唯一的字符串Key，这样在调用startAbility()方法时，应用就可以根据指定的Key来识别响应请求的UIAbility实例。在EntryAbility中，调用startAbility()方法时，可以在want参数中增加一个自定义参数，例如instanceKey，以此来区分不同的UIAbility实例

// 在启动指定实例模式的UIAbility时，给每一个UIAbility实例配置一个独立的Key标识
// 例如在文档使用场景中，可以用文档路径作为Key标识
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

function getInstance() {
  return 'key';
}

let context:common.UIAbilityContext = ...; // context为调用方UIAbility的UIAbilityContext
let want: Want = {
  deviceId: '', // deviceId为空表示本设备
  bundleName: 'com.example.myapplication',
  abilityName: 'SpecifiedAbility',
  moduleName: 'specified', // moduleName非必选
  parameters: { // 自定义信息
    instanceKey: getInstance(),
  },
}

context.startAbility(want).then(() => {
  console.info('Succeeded in starting ability.');
}).catch((err: BusinessError) => {
  console.error(`Failed to start ability. Code is ${err.code}, message is ${err.message}`);
})

由于SpecifiedAbility的启动模式被配置为指定实例启动模式，因此在SpecifiedAbility启动之前，会先进入对应的AbilityStage的onAcceptWant()生命周期回调中，以获取该UIAbility实例的Key值。然后系统会自动匹配，如果存在与该UIAbility实例匹配的Key，则会启动与之绑定的UIAbility实例，并进入该UIAbility实例的onNewWant()回调函数；否则会创建一个新的UIAbility实例，并进入该UIAbility实例的onCreate()回调函数和onWindowStageCreate()回调函数。
示例代码中，通过实现onAcceptWant()生命周期回调函数，解析传入的want参数，获取自定义参数instanceKey。业务逻辑会根据这个参数返回一个字符串Key，用于标识当前UIAbility实例。如果返回的Key已经对应一个已启动的UIAbility实例，系统会将该UIAbility实例拉回前台并获焦，而不会创建新的实例。如果返回的Key没有对应已启动的UIAbility实例，则系统会创建新的UIAbility实例并启动

import AbilityStage from '@ohos.app.ability.AbilityStage';
import Want from '@ohos.app.ability.Want';

export default class MyAbilityStage extends AbilityStage {
  onAcceptWant(want: Want): string {
    // 在被调用方的AbilityStage中，针对启动模式为specified的UIAbility返回一个UIAbility实例对应的一个Key值
    // 当前示例指的是module1 Module的SpecifiedAbility
    if (want.abilityName === 'SpecifiedAbility') {
      // 返回的字符串Key标识为自定义拼接的字符串内容
      if (want.parameters) {
        return `SpecifiedAbilityInstance_${want.parameters.instanceKey}`;
      }
    }

    return '';
  }
}


当应用的UIAbility实例已经被创建，并且配置为指定实例模式时，如果再次调用startAbility()方法启动该UIAbility实例，且AbilityStage的onAcceptWant()回调匹配到一个已创建的UIAbility实例，则系统会启动原来的UIAbility实例，并且不会重新创建一个新的UIAbility实例。此时，该UIAbility实例的onNewWant()回调会被触发，而不会触发onCreate()和onWindowStageCreate()生命周期回调。
DevEco Studio默认工程中未自动生成AbilityStage，AbilityStage文件的创建请参见AbilityStage组件容器。


## 基础组件
基础组件、容器组件、媒体组件、绘制组件、画布组件。
其中基础组件是视图层的基本组成单元，包括Text、Image、TextInput、Button、LoadingProgress等

### Text
 Text组件用于在界面上展示一段文本信息，可以包含子组件Span

 