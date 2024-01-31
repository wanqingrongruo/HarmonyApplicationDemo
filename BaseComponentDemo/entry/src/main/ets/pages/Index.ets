import ItemData from '../VideModel/ItemData'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Row() {
        Text("子目标")
          .fontColor(Color.Black)
          .fontSize(20)
        Text("编辑")
          .fontSize(12)
          .fontColor(Color.Blue)
      }
      .width('90%')
      .height(64)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(VerticalAlign.Center)

      List({ space: 10 }) {
        ForEach(this.getSettingListData(), (item: ItemData) => {
          ListItem() {
            Row() {
              Text(item.title)
                .fontColor(Color.Black)
                .fontSize(15)
              Text(item.progress)
                .fontSize(15)
                .fontColor(Color.Blue)
            }.width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(VerticalAlign.Center)
          }
        }, item => JSON.stringify(item))
      }.width('90%')
      .height('200')

      Button('添加子目标', { type: ButtonType.Capsule, stateEffect: true })
        .width('50%')
        .height(40)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .backgroundColor('#007DFF')

      Image($r('app.media.found'))
        .width('100')
        .height('100')
        .borderStyle(BorderStyle.Dashed).borderWidth(1).borderColor(0xAFEEEE).borderRadius(10)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Grey)
  }

  getSettingListData(): Array<ItemData> {
    let settingListData: ItemData[] = [
      new ItemData("目标一", "33%"),
      new ItemData("目标二", "35%"),
      new ItemData("目标三", "99%"),
      new ItemData("目标四", "44%"),
      new ItemData("目标五", "55%"),
      new ItemData("目标六", "11%"),
    ];
    return settingListData;
  }
}