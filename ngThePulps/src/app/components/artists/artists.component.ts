import { Component, OnInit } from '@angular/core';
import { Artist } from 'src/app/models/artist';

@Component({
  selector: 'app-artists',
  templateUrl: './artists.component.html',
  styleUrls: ['./artists.component.css']
})
export class ArtistsComponent implements OnInit {
  artists: Artist[] = [];

  ngOnInit(): void {

  }
}
