import { PublicationService } from './../../services/publication.service';
import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Publication } from 'src/app/models/publication';
import { AuthService } from 'src/app/services/auth.service';
import { Subscription } from 'rxjs';
import { MagazineService } from 'src/app/services/magazine.service';
import { Magazine } from 'src/app/models/magazine';
import { MagazineHtmlService } from 'src/app/services/magazine-html.service';
import { Router } from '@angular/router';
import { MagazineHtml } from 'src/app/models/magazine-html';
import { StoryService } from 'src/app/services/story.service';
import { Story } from 'src/app/models/story';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {

  stories: Story[] = [];
  magazineId: number = 0;
  storyId: number = 0;

  private magazineHtmlSubscription: Subscription | undefined;
  private storySubscription: Subscription | undefined;

  auth = inject(AuthService);
  magazineHtmlService = inject(MagazineHtmlService);
  storyService = inject(StoryService);
  router = inject(Router);

  ngOnInit() {
    // this.tempTestDeleteMeLater();

    this.storySubscription = this.storyService.indexAll().subscribe({
      next: (stories) => {
        this.stories = stories;
      },
      error: (fail) => {
        console.error('Error getting stories');
        console.error(fail);

      }
    });

  }

  ngOnDestroy() {
    if (this.storySubscription) {
      this.storySubscription.unsubscribe();
    }
    if (this.magazineHtmlSubscription) {
      this.magazineHtmlSubscription.unsubscribe();
    }
  }

  // test login
  // tempTestDeleteMeLater() {
  //   this.auth.login('admin', 'wombat1').subscribe({
  //     next: (data) => {
  //       console.log('Logged in: ');
  //       console.log(data);

  //     },
  //     error: (fail) => {
  //       console.error('Error authenticating: ');
  //       console.error(fail);
  //     }
  //   });
  // }

  navigateToMagazineHtml(magazine: Magazine): void {
    if (magazine && magazine.magazineHtml && magazine.magazineHtml.id) {
      this.magazineHtmlService.getMagazineHtmlById(magazine.magazineHtml.id).subscribe({
        next: (magazineHtml: MagazineHtml) => {
          if (magazineHtml && magazineHtml.fileUrl) {
            window.open(magazineHtml.fileUrl, '_blank');
          } else {
            console.error('MagazineHtml or fileUrl is missing.');
          }
        },
        error: (error) => {
          console.error('Error retrieving MagazineHtml.');
          console.error(error);
        },
      });
    } else {
      console.error('Magazine or MagazineHtml is missing.');
    }
  }

  // navigateToStoryAnchor(story: any): void {
  //   this.magazineService.findByStoryId(story.id).subscribe(
  //     (magazine: any) => {
  //       console.log('Magazine ID:', magazine.id);

  //       this.storyService.getStoryAnchorURL(story.id, magazine.id).subscribe(
  //         (url: string) => {
  //           console.log('Navigating to story anchor in magazine:', url);
  //           window.location.href = url; // Navigate to the URL in the current window
  //         },
  //         (error) => {
  //           console.error('Error navigating to story anchor in magazine', error);
  //         }
  //       );
  //     },
  //     (error) => {
  //       console.error('Error retrieving magazine or magazineId', error);
  //     }
  //   );
  // }

  // navigateToStoryAnchor(story: any): void {
  //   this.magazineService.findByStoryId(story.id).subscribe(
  //     (magazine: any) => {
  //       console.log('Magazine ID:', magazine.id);

  //       this.storyService.getStoryAnchorURL(story.id, magazine.id).subscribe(
  //         (url: string) => {
  //           console.log('Navigating to story anchor in magazine:', url);
  //           window.open(url, '_blank'); // Open the URL in a new tab
  //         },
  //         (error) => {
  //           console.error('Error navigating to story anchor in magazine', error);
  //         }
  //       );
  //     },
  //     (error) => {
  //       console.error('Error retrieving magazine or magazineId', error);
  //     }
  //   );
  // }

  // navigateToStoryAnchor(story: any): void {
  //   this.magazineService.findByStoryId(story.id).subscribe(
  //     (magazine: any) => {
  //       console.log('Magazine ID:', magazine.id);

  //       this.storyService.getStoryAnchorURL(story.id, magazine.id).subscribe(
  //         (url: string) => {
  //           console.log('Navigating to story anchor in magazine:', url);
  //           window.open(url, '_blank'); // Open the URL in a new tab
  //         },
  //         (error) => {
  //           console.error('Error navigating to story anchor in magazine', error);
  //         }
  //       );
  //     },
  //     (error) => {
  //       console.error('Error retrieving magazine or magazineId', error);
  //     }
  //   );
  // }

}
