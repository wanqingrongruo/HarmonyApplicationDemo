
class BaseType {

  print(msg: string) {
    console.log(msg);
  }
  main() {
    let isDone: boolean = false;
    let numer: number = 2024;

    // boolean, number(浮点型), string, 数组
    let list1: number[] = [1, 2, 3];
    let list2: Array<number> = [1, 2, 3];

    // 元组
    let t: [string, number];
    t = ["hello", 1];

    // 枚举
    let color: Color = Color.Red;

    // unknown
    let notSure: unknown = 4;
    notSure = "maybe a string instead";
    notSure = "false";

    // void
    this.test();

    // null 和 undefined
    let u: undefined = undefined;
    let n: null = null;

    // 联合类型
    let myFavorite: string | number;
    myFavorite = 'seven';
    myFavorite = 7;

    // 箭头函数
    let arrowFun = (num: number) => {
      if (num > 0) {
        this.test();
      }
    }

    let someArray = [1, "string", false];
    for(let item of someArray) {
      // @ts-ignore
      console.log(item);
    }

    // for...in 是遍历下标
  }

  test(): void {
    console.log("This function is void");
  }
}

enum Color {
  Red, Green, Blue
};

class Person {
  private name: string
  private age: number

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  public getPersonInfo(): string {
    return `My name is ${this.name} and age is ${this.age}`;
  }
}

export class Employee extends Person {
  private department: string

  constructor(name: string, age: number, department: string) {
    super(name, age);
    this.department = department;
  }

  public getEmployee(): string {
    return this.getPersonInfo() + `and work in ${this.department}`;
  }
}