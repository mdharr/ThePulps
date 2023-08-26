import { Component, inject, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Author } from 'src/app/models/author';
import { AuthorService } from 'src/app/services/author.service';

@Component({
  selector: 'app-authors',
  templateUrl: './authors.component.html',
  styleUrls: ['./authors.component.css']
})
export class AuthorsComponent implements OnInit {
  authors: Author[] = [];

  private authorsSubscription: Subscription | undefined;

  authorService = inject(AuthorService);

  ngOnInit(): void {

    this.authorsSubscription = this.authorService.indexAll().subscribe({
      next: (authors) => {
        this.authors = authors;
      },
      error: (fail) => {
        console.error('Error getting authors');
        console.error(fail);
      }
    });
  }
}
