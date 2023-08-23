export class Artist {

  id: number;
  fullName: string;

  thumbnailUrl: string;
  imageUrl: string;

  constructor(
    id: number = 0,
    fullName: string = '',
    thumbnailUrl: string = '',
    imageUrl: string = ''
  ) {
    this.id = id;
    this.fullName = fullName;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
  }
}
