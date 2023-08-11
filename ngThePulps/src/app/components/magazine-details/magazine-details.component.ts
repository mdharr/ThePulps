import { Component, OnInit, Renderer2 } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Subscription } from 'rxjs';
import { Magazine } from 'src/app/models/magazine';
import { AuthService } from 'src/app/services/auth.service';
import { MagazineHtmlService } from 'src/app/services/magazine-html.service';
import { MagazineService } from 'src/app/services/magazine.service';
import { PublicationService } from 'src/app/services/publication.service';

@Component({
  selector: 'app-magazine-details',
  templateUrl: './magazine-details.component.html',
  styleUrls: ['./magazine-details.component.css']
})
export class MagazineDetailsComponent implements OnInit {

  magazine: Magazine =  new Magazine();
  publicationId: number = 0;
  magazineId: number = 0;

  private magazineSubscription: Subscription | undefined;

  constructor(
              private auth: AuthService,
              private magazineService: MagazineService,
              private activatedRoute: ActivatedRoute,
              private magazineHtmlService: MagazineHtmlService,
              private renderer: Renderer2
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
      }
    });
  }

  onImageLoad(magazineImage: HTMLImageElement, magazineTitle: HTMLDivElement) {
    this.renderer.addClass(magazineImage, 'loaded');
    this.renderer.setStyle(magazineTitle, 'display', 'block');
  }

}
