
@Preview
@Component
export struct VerticalButton {
  @Prop message: string
  clickHandler: (() => void) | null

  update() {
    // do something
  }

  build() {
    Column() {
      Image($r('app.media.icon'))
        .width(50)
        .height(50)
      Text(this.message)
    }
    .backgroundColor("#000000")
    .onClick(() => {
      if (this.clickHandler != null) {
        this.clickHandler()
      }
    })
  }
}