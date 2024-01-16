import router from "@ohos.router";

let msg = "Index 页面传来的数据"

@Entry
@Component
struct Index {
  @State message: string = 'Index Page'
  @State src: string = 'null'

  build() {
    Row() {
      Column() {
        Text(this.message)
        Text(this.src)
        Blank()
        Button('Next')
          .backgroundColor(Color.Blue)
          .fontColor(Color.White)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/SecondPage',
              params: {
                src: msg
              }
            })
          })
      }
      .width('100%').height(140)
    }
    .height('100%').backgroundColor(0xF1F3F5)
  }

  onPageShow() {
    this.src = router.getParams()?.['src'];
  }
}