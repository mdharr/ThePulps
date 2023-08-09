import { ActivatedRoute, ParamMap } from '@angular/router';
import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AuthService } from 'src/app/services/auth.service';
import { PublicationService } from 'src/app/services/publication.service';
import { Publication } from 'src/app/models/publication';
import { Magazine } from 'src/app/models/magazine';

@Component({
  selector: 'app-publication-details',
  templateUrl: './publication-details.component.html',
  styleUrls: ['./publication-details.component.css']
})
export class PublicationDetailsComponent implements OnInit, OnDestroy {

  // property initialization
  publicationId: number = 0;
  publication: Publication = new Publication();
  publicationName: string = '';

  // service injection
  auth = inject(AuthService);
  publicationService = inject(PublicationService);
  activatedRoute = inject(ActivatedRoute);

  // subscription declaration
  private paramsSubscription: Subscription | undefined;
  private publicationSubscription: Subscription | undefined;

  // On Initialization
  ngOnInit() {
    this.getRouteParams();
    this.subscribeToPublicationServiceById();
  }

  // On Component Destroy
  ngOnDestroy(): void {
    this.destroySubscriptions();
  }

  // Retrieve Parameters from Route
  getRouteParams = () => {
    this.paramsSubscription = this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      let idString = params.get('publicationId');
      // url endpoint stretch goal
      // let idString2 = params.get('publicationName');
      if(idString) {
        this.publicationId = +idString;
        // url endpoint stretch goal
        // this.publicationName = idString2;
      }

    });
  }

  // Subscribe to Publication Service
  subscribeToPublicationServiceById = () => {
    this.publicationSubscription = this.publicationService.find(this.publicationId).subscribe({
      next: (publication) => {
        this.publication = publication;
      },
      error:(fail) => {
        console.error('Error getting publication');
        console.error(fail);
      }
    });
  }

  // Unsubscribe from Subscriptions
  destroySubscriptions = () => {
    if(this.paramsSubscription) {
      this.paramsSubscription.unsubscribe();
    }

    if(this.publicationSubscription) {
      this.publicationSubscription.unsubscribe();
    }

    if(this.publicationSubscription) {
      this.publicationSubscription.unsubscribe();
    }
  }

  // subscribeToPublicationServiceByName = () => {
  //     // using publication name in url instead of id number
  //     this.publicationSubscription = this.publicationService.findByName(this.publicationName).subscribe({
  //       next: (publication) => {
  //         this.publication = publication;
  //       },
  //       error:(fail) => {
  //         console.error('Error getting publication');
  //         console.error(fail);
  //       }
  //     });
  // }

}
