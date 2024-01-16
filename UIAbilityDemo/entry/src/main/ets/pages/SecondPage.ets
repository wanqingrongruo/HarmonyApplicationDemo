import router from "@ohos.router";

@Entry
@Component
struct SecondPage {
  @State message: string = 'Second Page';
  @State src: string = router.getParams()?.['src'];

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
      }
      .width('100%').height(140)
    }
    .height('100%').backgroundColor(0xF1F3F5)
  }
}