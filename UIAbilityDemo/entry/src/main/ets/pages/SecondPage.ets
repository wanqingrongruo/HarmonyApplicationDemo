// @ts-nocheck
import router from "@ohos.router";
import { VerticalButton } from './VerticalButton';

@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page';
  @State src: string = router.getParams()?.['src'];

  // 使用 Builder 装饰器，组件内处理子组件的显示逻辑
  @Builder createCommonView() {
    Text("builder")
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
        Text(this.src)
        Blank()
        Button('Back')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .onClick(() => {
            router.back({
              url: 'pages/Index',
              params: {
                src: 'Second 页面传来的数据'
              }
            });
          })
        // 外部定义的组件， 可复用
        VerticalButton({ message: $this.message, clickHandler: () => {

        }})
        HDemoRow({ message: this.message, src: this.src})
          .backgroundColor(Color.Red) // 自定义组件设置的样式是对自定义组件的内部组件外层生成的壳进行设置
        this.createCommonView()
      }
      .width('100%').height(140)
    }
    .height('100%').backgroundColor(0xF1F3F5)
  }
}

// 同文件中自定义组件
@Component
struct HDemoRow {
  private message: string
  private src: string
  build() {
    Row() {
      Text(this.message)
      Text(this.src)
    }
    .width('100%')
    .height('100%')
  }
}