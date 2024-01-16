import CommonConstant from "../Constant/CommonConstant"
import DataModel from "../ViewModel/DataModel"
import ToDoItem from "../View/ToDoItem"

@Entry
@Component
struct TodoListPage {

  private totalTasks: Array<string> = [];

  aboutToAppear() {
    this.totalTasks = DataModel.getData();
  }

  aboutToDisappear() {

  }

  onPageShow() {

  }

  onPageHide() {

  }

  onBackPress() {

  }

  build() {
    Column() {
      Text($r('app.string.page_title'))
        .fontSize($r('app.float.title_font_size'))
        .fontWeight(FontWeight.Bold)
        .lineHeight($r('app.float.title_font_height'))
        .width(CommonConstant.TITLE_WIDTH)
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom')
        })
        .textAlign(TextAlign.Start)
      
      ForEach(this.totalTasks, (item: string) => {
        ToDoItem({content: item})
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstant.FULL_LENGTH)
    .height(CommonConstant.FULL_LENGTH)
    .backgroundColor($r('app.color.page_background'))
    .borderRadius(CommonConstant.BORDER_RADIUS)
  }
}