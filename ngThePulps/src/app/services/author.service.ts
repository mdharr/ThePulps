import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Author } from '../models/author';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthorService {
  private url = environment.baseUrl + 'api/authors';
  private otherUrl = environment.baseUrl + 'api';

  constructor(private http: HttpClient, private authService: AuthService) { }

  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.authService.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  indexAll(): Observable<Author[]> {
    return this.http.get<Author[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'AuthorService.indexAll(): error retrieving author list: ' + err
          )
        );
      })
    );
  }

  getAuthorById(id: number): Observable<Author> {
    return this.http.get<Author>(this.url + '/' + id).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error('AuthorService.getAuthorById: error retrieving author: ' + err)
        );
      })
    );
  }

}
