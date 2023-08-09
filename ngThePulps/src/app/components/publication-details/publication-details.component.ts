import { ActivatedRoute, ParamMap } from '@angular/router';
import { Component, OnInit } from '@angular/core';
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
export class PublicationDetailsComponent implements OnInit {

  publicationId: number = 0;
  publication: Publication = new Publication();
  publicationName: string = '';

  private publicationSubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private publicationService: PublicationService,
              private activatedRoute: ActivatedRoute
    ) {}

  ngOnInit() {

    this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      let idString = params.get('publicationId');
      // url endpoint stretch goal
      // let idString2 = params.get('publicationName');
      if(idString) {
        this.publicationId = +idString;
        // url endpoint stretch goal
        // this.publicationName = idString2;
      }
      this.publicationSubscription = this.publicationService.find(this.publicationId).subscribe({
        next: (publication) => {
          this.publication = publication;
        },
        error:(fail) => {
          console.error('Error getting publication');
          console.error(fail);
        }
      });

      // this.publicationSubscription = this.publicationService.findByName(this.publicationName).subscribe({
      //   next: (publication) => {
      //     this.publication = publication;
      //   },
      //   error:(fail) => {
      //     console.error('Error getting publication');
      //     console.error(fail);
      //   }
      // });

    });

  }

}
