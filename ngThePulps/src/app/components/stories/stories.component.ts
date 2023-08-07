import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Subscription } from 'rxjs';
import { Author } from 'src/app/models/author';
import { Magazine } from 'src/app/models/magazine';
import { Story } from 'src/app/models/story';
import { AuthService } from 'src/app/services/auth.service';
import { MagazineHtmlService } from 'src/app/services/magazine-html.service';
import { MagazineService } from 'src/app/services/magazine.service';
import { StoryService } from 'src/app/services/story.service';

@Component({
  selector: 'app-stories',
  templateUrl: './stories.component.html',
  styleUrls: ['./stories.component.css']
})
export class StoriesComponent implements OnInit {

  magazine: Magazine = new Magazine();
  publicationId: number = 0;
  magazineId: number = 0;
  stories: Story[] = [];
  authors: Author[] = [];

  private magazineSubscription: Subscription | undefined;
  private storySubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private magazineService: MagazineService,
              private activatedRoute: ActivatedRoute,
              private magazineHtmlService: MagazineHtmlService,
              private storyService: StoryService
    ) {}

  ngOnInit() {
    this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      let idString = params.get('publicationId');
      let idString2 = params.get('magazineId');
      if(idString && idString2) {
        this.publicationId = +idString;
        this.magazineId = +idString2;

        this.magazineSubscription = this.magazineService.find(this.magazineId).subscribe({
          next: (magazine) => {
            this.magazine = magazine;
          },
          error: (fail) => {
            console.error('Error getting magazine');
            console.error(fail);
          }
        });
        this.storySubscription = this.magazineService.indexStories(this.magazineId).subscribe({
          next: (stories) => {
            this.stories = stories;
          },
          error: (fail) => {
            console.error('Error getting stories');
            console.error(fail);
          }
        })
      }
    });
  }

    navigateToStoryAnchor(story: any): void {
    this.magazineService.findByStoryId(story.id).subscribe(
      (magazine: any) => {
        console.log('Magazine ID:', magazine.id);

        this.storyService.getStoryAnchorURL(story.id, magazine.id).subscribe(
          (url: string) => {
            console.log('Navigating to story anchor in magazine:', url);
            window.open(url, '_blank'); // Open the URL in a new tab
          },
          (error) => {
            console.error('Error navigating to story anchor in magazine', error);
          }
        );
      },
      (error) => {
        console.error('Error retrieving magazine or magazineId', error);
      }
    );
  }

  // formatStoryType(types: string[]): string[] {
  //   return types.map(type => {
  //     const words = type.split('_');
  //     const formattedWords = words.map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase());
  //     return formattedWords.join(' ');
  //   });
  // }

  formatStoryType(type: string): string {
    const words = type.split('_');
    const formattedWords = words.map(word => word.charAt(0).toUpperCase() + word.slice(1).toLowerCase());
    return formattedWords.join(' ');
  }

  getAuthorsByStoryId(story: any): Author[] {
    this.storyService.getAuthorsByStoryId(story.id)
    return [];
  }

}
