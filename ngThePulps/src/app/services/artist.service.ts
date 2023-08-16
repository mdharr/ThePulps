import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Artist } from '../models/artist';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class ArtistService {
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

  indexAll(): Observable<Artist[]> {
    return this.http.get<Artist[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'ArtistService.indexAll(): error retrieving artist index: ' + err
          )
        );
      })
    );
  }
}
