import { Magazine } from "./magazine";

export class Publication {
  id: number;
  name: string;
  createdAt: string;
  magazines: Magazine[];
  // tags: Tag[] = [];
  thumbnailUrl: string;
  imageUrl: string;
  description: string;

  constructor(
    id: number = 0,
    name: string = '',
    createdAt: string = '',
    magazines: Magazine[] = [],
    thumbnailUrl: string = '',
    imageUrl: string = '',
    description: string = ''
  ) {
    this.id = id;
    this.name = name;
    this.createdAt = createdAt;
    this.magazines = magazines;
    this.thumbnailUrl = thumbnailUrl;
    this.imageUrl = imageUrl;
    this.description = description;
  }
}
