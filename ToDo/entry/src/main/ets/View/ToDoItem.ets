
import CommonConstant from "../Constant/CommonConstant"

@Component
export default struct ToDoItem {
  private content?: string
  @State isComplete: boolean = false

  @Builder lableIcon(icon: Resource) {
    Image(icon)
      .objectFit(ImageFit.Contain)
      .width($r('app.float.checkbox_width'))
      .height($r('app.float.checkbox_width'))
      .margin($r('app.float.checkbox_margin'))
  }

  build() {
    Column() {
      Row() {
        if (this.isComplete) {
          this.lableIcon($r('app.media.ic_ok'))
        } else {
          this.lableIcon($r('app.media.ic_default'))
        }

        Text(this.content)
          .fontSize($r('app.float.item_font_size'))
          .fontWeight(CommonConstant.FONT_WEIGHT)
          .opacity(this.isComplete ? CommonConstant.OPACITY_COMPLETED : CommonConstant.OPACITY_DEFAULT)
          .decoration({ type: this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None })
      }
      .backgroundColor($r('app.color.start_window_background'))
      .width(CommonConstant.LIST_DEFAULT_WIDTH)
      .height($r('app.float.list_item_height'))
      .borderRadius(CommonConstant.BORDER_RADIUS)
      .onClick(() => {
        this.isComplete = !this.isComplete;
      })

      Divider()
        .height(10)
        .backgroundColor($r('app.color.page_background'));
    }
  }
}