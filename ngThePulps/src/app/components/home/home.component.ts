import { PublicationService } from './../../services/publication.service';
import { Component, OnInit } from '@angular/core';
import { Publication } from 'src/app/models/publication';
import { AuthService } from 'src/app/services/auth.service';
import { Subscription } from 'rxjs';
import { MagazineService } from 'src/app/services/magazine.service';
import { Magazine } from 'src/app/models/magazine';
import { MagazineHtmlService } from 'src/app/services/magazine-html.service';
import { Router } from '@angular/router';
import { MagazineHtml } from 'src/app/models/magazine-html';
import { ThisReceiver } from '@angular/compiler';
import { StoryService } from 'src/app/services/story.service';
import { Story } from 'src/app/models/story';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  publications: Publication[] = [];
  magazines: Magazine[] = [];
  stories: Story[] = [];

  private publicationSubscription: Subscription | undefined;
  private magazineSubscription: Subscription | undefined;
  private magazineHtmlSubscription: Subscription | undefined;
  private storySubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private publicationService: PublicationService,
              private magazineService: MagazineService,
              private magazineHtmlService: MagazineHtmlService,
              private storyService: StoryService,
              private router: Router
              ) {}

  ngOnInit() {
    this.tempTestDeleteMeLater(); // DELETE LATER!!!
    this.publicationSubscription = this.publicationService.indexAll().subscribe({
      next: (publications) => {
        this.publications = publications;
      },
      error:(fail) => {
        console.error('Error getting publications');
        console.error(fail);
      }
    });

    this.magazineSubscription = this.magazineService.indexAll().subscribe({
      next: (magazines) => {
        this.magazines = magazines;
      },
      error: (fail) => {
        console.error('Error getting magazines');
        console.error(fail);

      }
    });

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

  tempTestDeleteMeLater() {
    this.auth.login('admin', 'wombat1').subscribe({
      next: (data) => {
        console.log('Logged in: ');
        console.log(data);

      },
      error: (fail) => {
        console.error('Error authenticating: ');
        console.error(fail);
      }
    });
  }

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



}
