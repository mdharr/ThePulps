import { PublicationService } from './../../services/publication.service';
import { Component, OnInit } from '@angular/core';
import { Publication } from 'src/app/models/publication';
import { AuthService } from 'src/app/services/auth.service';
import { Subscription } from 'rxjs';
import { MagazineService } from 'src/app/services/magazine.service';
import { Magazine } from 'src/app/models/magazine';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  publications: Publication[] = [];
  magazines: Magazine[] = [];

  private publicationSubscription: Subscription | undefined;
  private magazineSubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private publicationService: PublicationService,
              private magazineService: MagazineService
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
    })
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

}
