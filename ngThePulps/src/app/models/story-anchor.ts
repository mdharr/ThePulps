export class StoryAnchor {
  id: {
    storyId: number;
    magazineHtmlId: number;
  };
  anchorTag: string;

  constructor(
    id: { storyId: number, magazineHtmlId: number },
    anchorTag: string = ''
  ) {
    this.id = id;
    this.anchorTag = anchorTag;
  }
}
