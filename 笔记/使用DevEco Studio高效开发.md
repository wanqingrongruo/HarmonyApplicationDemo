# 使用DevEco Studio高效开发
#学习/鸿蒙/应用

项目升级迁移
https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101680766639443507

高效使用 DevEco
[<HarmonyOS主题课>使用DevEco Studio高效开发-华为开发者学堂](https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101680766639443507)

快速开始：
DevEco-help-quick start
里面包含一些快速教程， 应用签名 SDK 管理等都有

### 自动导包
mac: 
选中要到的包名，==**option+enter**== + 选择”import XXXX“
Window:
选中要到的包名，alt+enter + 选择”import XXXX“

### **代码查找**
通过对符号、类或文件的即时导航来查找代码。检查调用或类型层次结构，轻松地搜索工程里的所有内容。通过连续按压**两次Shift**快捷键，打开代码查找界面，双击查找的结果可以快速打开所在文件的位置。

### API 文档查看
查看 api:
选择 Image(要查看的类) -  show in Api Reference

### 代码检查
在要检查的文件中 右击-Code Linter
快捷键： option + shift + h

### 格式化代码
cmd+opt+L

### 代码结构树
cmd+7 (或者 IDE 的侧边左下角的菜单）

### 代码引用查找
提供Find Usages代码引用查找功能，帮助开发者快速查看某个对象(变量、函数或者类等)被引用的地方，用于后续的代码重构，可以极大的提升开发者的开发效率。
使用方法：在要查找的对象上，单击鼠标**右键 > Find Usages**或使用快捷键**Alt +F7**（macOS为**Command +** **F7**）

## 预览器的使用
https://developer.huawei.com/consumer/cn/training/course/slightMooc/C101680766639443507
### 查看ArkTS和JS应用/服务预览效果
预览器支持JS和ArkTS应用/服务“实时预览”和“动态预览”。

**说明**
* 预览Phone、Tablet、TV和Wearable设备的JS/ArkTS工程，预览器功能依赖于电脑显卡的OpenGL版本，OpenGL版本要求为3.2及以上。
* richtext、web、video、XComponent组件不支持预览。
* 不支持调用C++库的预览。
* har在被应用和原子化服务使用时真机效果有区别，真机上实际效果应用不显示menubar，原子化服务显示menubar，但预览器都以不显示menubar为准。若开发har模块时，请注意被原子化服务使用时预览器效果与真机效果的不同。

**实时预览**：在开发界面UI代码过程中，如果添加或删除了UI组件，您只需**Ctrl+S**进行保存，然后预览器就会立即刷新预览结果。如果修改了组件的属性，则预览器会实时（亚秒级）刷新预览结果，达到极速预览的效果（当前版本极速预览仅支持ArkTS组件）。

**动态预览**：在预览器界面，可以在预览器中操作应用/服务的界面交互动作，如单击、跳转、滑动等，与应用/服务运行在真机设备上的界面交互体验一致。


以ArkTS为例，使用预览器的方法如下：
* 创建或打开一个ArkTS应用/服务工程。本示例以打开一个本地ArkTS Demo工程为例。
* 在工程目录下，打开任意一个.ets文件（JS工程请打开.hml/.css/.js页面）。
* 可以通过如下任意一种方式打开预览器开关，显示效果如下图所示：
  * 通过菜单栏，单击**View>Tool Windows>Previewer**打开预览器。
  * 在编辑窗口右上角的侧边工具栏，单击**Previewer**，打开预览器。
![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image.png)

### 查看ArkUI预览效果
ArkUI预览支持页面预览与组件预览，下图中左侧图标![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/0000000000011111111.20240111104614.60389910992310263802403189835482-50001231000000-2800-4E77923F005DDF6E04C4E3BBE2EDAF807818CE5F6BCD291D06EADCDD07ED9C99.png)为页面预览，右侧图标![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/0000000000011111111.20240111104614.12120634422312827634417462507066-50001231000000-2800-AF193EC9A93ADA65C5FDF030175AA55BD226DCE622D5B12932D18A06FB2B7858.png)为组件预览。
![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image%202.png)<!-- {"width":399} -->


**页面预览**
ArkTS应用/服务支持页面预览，要求compileSdkVersion为7或以上。页面预览通过在工程的ets文件头部添加注解@Entry实现。
```
		@Entry
		@Component
		struct Index {
		  @State message: string = 'Hello World'
		
		  build() {
		    Row() {
		      Column() {
		        Text(this.message)
		          .fontSize(50)
		          .fontWeight(FontWeight.Bold)
		      }
		      .width('100%')
		    }
		    .height('100%')
		  }
		}
```

**组件预览**
ArkTS应用/服务支持组件预览，要求compileSdkVersion为8或以上。组件预览支持实时预览，不支持动态图和动态预览。组件预览通过在组件前添加注解@Preview实现，在单个源文件中，最多可以使用10个@Preview装饰自定义组件。
@Preview组件预览效果如下图所示：
![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image%203.png)

组件预览默认的预览设备为Phone，若您想在不同的设备，或者不同的屏幕形状，或者不同设备语言等情况下的组件预览效果，可以通过设置@Preview的参数，指定预览设备的相关属性。若不设置@Preview的参数，默认的设备属性如下所示：
```
@Preview({
  title: 'Component1'  //预览组件的名称
  deviceType: 'phone',  //指定当前组件预览渲染的设备类型，默认为Phone
  width: 1080,  //预览设备的宽度，单位：px
  height: 2340,  //预览设备的长度，单位：px
  colorMode: 'light',  //显示的亮/暗模式，取值为light或dark
  dpi: 480,  //预览设备的屏幕DPI值
  locale: 'zh_CN',  //预览设备的语言，如zh_CN、en_US等
  orientation: 'portrait',  //预览设备的横竖屏状态，取值为portrait或landscape
  roundScreen: false  //设备的屏幕形状是否为圆形
})

```
请注意，如果被预览的组件是依赖参数注入的组件，建议的预览方式是：定义一个组件片段，在该片段中声明将要预览的组件，以及该组件依赖的入参，并在组件片段上标注@Preview注解，以表明将预览该片段中的内容。例如，要预览如下组件：
```
		@Component
		struct Title {
		  context: string
		  build() {
		    Text(this.context)
		  }
		}
```
建议按如下方式预览：
```
@Preview
@Component    //定义组件片段TitlePreview
struct TitlePreview {
  build() {
    Title({ context: 'MyTitle' })    //在该片段中声明将要预览的组件Title，以及该组件依赖的入参 {context: ’MyTitle’}
  }
}
```

### 查看多端设备预览效果
DevEco Studio支持HarmonyOS分布式应用/服务开发，同一个应用/服务可以运行在多个设备上。在HarmonyOS分布式应用/服务的开发阶段，因不同设备的屏幕分辨率、形状、大小等不同，开发者需要在不同的设备上查看应用/服务的UI布局和交互效果，此时便可以使用多端设备预览器功能，方便开发者在应用/服务开发过程中，随时查看不同设备上的运行效果。

**说明**
多端设备预览最多同时支持4个设备的预览。

![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image%204.png)

### Inspector双向预览
DevEco Studio提供HarmonyOS应用/服务的UI预览界面与源代码文件间的双向预览功能，支持ets文件、hml文件及xml文件与预览器界面的双向预览。使用双向预览功能时，需要在预览器界面单击![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/0000000000011111111.20240111104615.30578063654639389790767734242797-50001231000000-2800-CD3AB968F12E5D6A9D5036EA2EC3F4C326E229DB0390EC1226553323EAA2B45A.png)图标打开双向预览功能。

**说明**
暂不支持服务卡片的双向预览功能。
![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image%205.png)
开启双向预览功能后，支持代码编辑器、UI界面和Component Tree 组件树三者之间的联动：
* 选中预览器UI界面中的组件，则组件树上对应的组件将被选中，同时代码编辑器中的布局文件中对应的代码块高亮显示。
* 选中布局文件中的代码块，则在UI界面会高亮显示，组件树上的组件节点也会呈现被选中的状态。
* 选中组件树中的组件，则对应的代码块和UI界面也会高亮显示。

在预览界面还可以通过组件的属性面板修改可修改的属性或样式，在预览界面修改后，预览器会自动同步到代码编辑器中修改源码，并实时的刷新UI界面；同样的，如果在代码编辑器中修改源码，也会实时刷新UI界面，并更新组件树。

**说明**
* 如果组件有做数据绑定，则其属性不支持在属性面板修改。
* 如果界面有使用动画效果或者带动画效果组件，则其属性不支持在属性面板修改。
* 多设备预览时，不支持双向预览。

### 多语言、横屏、其他
![](%E4%BD%BF%E7%94%A8DevEco%20Studio%E9%AB%98%E6%95%88%E5%BC%80%E5%8F%91/image%206.png)