export class Collection {
  id: number;
  name: string;
  createdAt: string;
  thumbnailUrl: string;
  backgroundUrl: string;

  constructor(
    id: number = 0,
    name: string = '',
    createdAt: string = '',
    thumbnailUrl: string = '',
    backgroundUrl: string = ''
  ) {
    this.id = id;
    this.name = name;
    this.createdAt = createdAt;
    this.thumbnailUrl = thumbnailUrl;
    this.backgroundUrl = backgroundUrl;
  }
}
