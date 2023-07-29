import { ActivatedRoute, ParamMap } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { AuthService } from 'src/app/services/auth.service';
import { PublicationService } from 'src/app/services/publication.service';
import { Publication } from 'src/app/models/publication';

@Component({
  selector: 'app-publication-details',
  templateUrl: './publication-details.component.html',
  styleUrls: ['./publication-details.component.css']
})
export class PublicationDetailsComponent implements OnInit {

  publicationId: number = 0;
  publication: Publication = new Publication();

  private publicationSubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private publicationService: PublicationService,
              private activatedRoute: ActivatedRoute
    ) {}

  ngOnInit() {

    this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      let idString = params.get('publicationId');
      if(idString) {
        this.publicationId = +idString;
      }
      this.publicationSubscription = this.publicationService.find(this.publicationId).subscribe({
        next: (publication) => {
          this.publication = publication;
        },
        error:(fail) => {
          console.error('Error getting publications');
          console.error(fail);
        }
      });

    });

  }

}
