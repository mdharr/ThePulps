import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Subscription } from 'rxjs';
import { Magazine } from 'src/app/models/magazine';
import { AuthService } from 'src/app/services/auth.service';
import { MagazineService } from 'src/app/services/magazine.service';
import { PublicationService } from 'src/app/services/publication.service';

@Component({
  selector: 'app-magazines',
  templateUrl: './magazines.component.html',
  styleUrls: ['./magazines.component.css']
})
export class MagazinesComponent implements OnInit {

  magazines: Magazine[] = [];
  publicationId: number = 0;

  private magazineSubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private magazineService: MagazineService,
              private publicationService: PublicationService,
              private activatedRoute: ActivatedRoute
    ) {}

  ngOnInit() {
    this.activatedRoute.paramMap.subscribe((params: ParamMap) => {
      let idString = params.get('publicationId');
      if(idString) {
        this.publicationId = +idString;

        this.magazineSubscription = this.publicationService.indexMagazinesByPublicationId(this.publicationId).subscribe({
          next: (magazines) => {
            this.magazines = magazines;
          },
          error: (fail) => {
            console.error('Error getting magazines');
            console.error(fail);
          }
        });
      }

    });

  }

}
