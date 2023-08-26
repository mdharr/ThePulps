import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Publication } from 'src/app/models/publication';
import { AuthService } from 'src/app/services/auth.service';
import { PublicationService } from 'src/app/services/publication.service';

@Component({
  selector: 'app-publications',
  templateUrl: './publications.component.html',
  styleUrls: ['./publications.component.css']
})
export class PublicationsComponent implements OnInit, OnDestroy {

  publications: Publication[] = [];

  private publicationSubscription: Subscription | undefined;

  auth = inject(AuthService);
  publicationService = inject(PublicationService);

  ngOnInit() {

    this.publicationSubscription = this.publicationService.indexAll().subscribe({
      next: (publications) => {
        this.publications = publications;
      },
      error:(fail) => {
        console.error('Error getting publications');
        console.error(fail);
      }
    });

  }

  ngOnDestroy() {
    if (this.publicationSubscription) {
      this.publicationSubscription.unsubscribe();
    }
  }

  // url experiment stretch goal
  formatPublicationNameForUrl(name: string): string {
    return name.toLowerCase().replace(/\s+/g, '-');
  }

}
