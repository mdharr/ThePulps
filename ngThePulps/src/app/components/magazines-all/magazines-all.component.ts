import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Magazine } from 'src/app/models/magazine';
import { MagazineService } from 'src/app/services/magazine.service';

@Component({
  selector: 'app-magazines-all',
  templateUrl: './magazines-all.component.html',
  styleUrls: ['./magazines-all.component.css']
})
export class MagazinesAllComponent implements OnInit, OnDestroy {
  magazines: Magazine[] = [];

  private magazinesSubscription: Subscription | undefined;

  magazinesService = inject(MagazineService);

  ngOnInit(): void {

    this.magazinesSubscription = this.magazinesService.indexAll().subscribe({
      next: (magazines) => {
        this.magazines = magazines;
      },
      error: (fail) => {
        console.error('Error getting magazines');
        console.error(fail);
      }
    });
  }

  ngOnDestroy() {
    if (this.magazinesSubscription) {
      this.magazinesSubscription.unsubscribe();
    }
  }
}
