import CommonConstant from "../Constant/CommonConstant"

export class DataModel {
  private tasks: string[] = CommonConstant.TODO_DATA;

  getData(): string[] {
    return this.tasks;
  }
}

export default new DataModel();