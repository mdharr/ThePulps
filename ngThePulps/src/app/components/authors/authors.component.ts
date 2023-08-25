import { Component, OnInit } from '@angular/core';
import { Author } from 'src/app/models/author';

@Component({
  selector: 'app-authors',
  templateUrl: './authors.component.html',
  styleUrls: ['./authors.component.css']
})
export class AuthorsComponent implements OnInit {
  authors: Author[] = [];

  ngOnInit(): void {

  }
}
