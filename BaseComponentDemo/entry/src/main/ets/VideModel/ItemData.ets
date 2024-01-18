export default class PageResource {
  /**
   * Text of list item.
   */
  title: string;
  /**
   * Image of list item.
   */
  progress: string;


  constructor(title: string, progress: string) {
    this.title = title;
    this.progress = progress;
  }
}