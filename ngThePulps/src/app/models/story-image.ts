import { Story } from "./story";

export class StoryImage {
  id: number;
  story: Story;
  imageUrl: string;

  constructor(
    id: number = 0,
    story: Story = new Story(),
    imageUrl: string = ''
  ) {
    this.id = id;
    this.story = story;
    this.imageUrl = imageUrl;
  }
}
