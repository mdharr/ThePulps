import { Component, inject, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Artist } from 'src/app/models/artist';
import { ArtistService } from 'src/app/services/artist.service';

@Component({
  selector: 'app-artists',
  templateUrl: './artists.component.html',
  styleUrls: ['./artists.component.css']
})
export class ArtistsComponent implements OnInit {
  artists: Artist[] = [];

  private artistsSubscription: Subscription | undefined;

  artistService = inject(ArtistService);

  ngOnInit(): void {

    this.artistsSubscription = this.artistService.indexAll().subscribe({
      next: (artists) => {
        this.artists = artists;
      },
      error: (fail) => {
        console.error('Error getting artists');
        console.error(fail);
      }
    });
  }
}
