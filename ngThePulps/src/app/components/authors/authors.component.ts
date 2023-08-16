import { Component } from '@angular/core';
import { Author } from 'src/app/models/author';

@Component({
  selector: 'app-authors',
  templateUrl: './authors.component.html',
  styleUrls: ['./authors.component.css']
})
export class AuthorsComponent {
authors: Author[] = [];
}
