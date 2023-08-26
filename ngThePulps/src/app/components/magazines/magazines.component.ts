import { Component, ElementRef, inject, OnDestroy, OnInit, Renderer2, ViewChild } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Subscription } from 'rxjs';
import { Magazine } from 'src/app/models/magazine';
import { MagazineHtml } from 'src/app/models/magazine-html';
import { AuthService } from 'src/app/services/auth.service';
import { MagazineHtmlService } from 'src/app/services/magazine-html.service';
import { MagazineService } from 'src/app/services/magazine.service';
import { PublicationService } from 'src/app/services/publication.service';

@Component({
  selector: 'app-magazines',
  templateUrl: './magazines.component.html',
  styleUrls: ['./magazines.component.css']
})
export class MagazinesComponent implements OnInit, OnDestroy {

  magazines: Magazine[] = [];
  publicationId: number = 0;

  @ViewChild('magazineImage', { static: false }) magazineImageRef!: ElementRef<HTMLImageElement>;

  private magazineSubscription: Subscription | undefined;

  auth = inject(AuthService);
  magazineService = inject(MagazineService);
  publicationService = inject(PublicationService);
  activatedRoute = inject(ActivatedRoute);
  magazineHtmlService = inject(MagazineHtmlService);
  renderer = inject(Renderer2);

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

  ngOnDestroy() {
    if (this.magazineSubscription) {
      this.magazineSubscription.unsubscribe();
    }
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

  onImageLoad(magazineImage: HTMLImageElement) {
    this.renderer.addClass(magazineImage, 'loaded');
  }

}
