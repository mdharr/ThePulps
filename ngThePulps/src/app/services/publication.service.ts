import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Publication } from '../models/publication';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class PublicationService {
  private url = environment.baseUrl + 'api/publications';
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

  indexAll(): Observable<Publication[]> {
    return this.http.get<Publication[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'PublicationService.indexAll(): error retrieving publication list: ' + err
          )
        );
      })
    );
  }

  find(id: number): Observable<Publication> {
    return this.http.get<Publication>(`${this.url}/${id}`).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error('PublicationService.find(): error retrieving publication: ' + err)
        );
      })
    );
  }
}
