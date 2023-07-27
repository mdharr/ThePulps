import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Magazine } from '../models/magazine';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class MagazineService {
  private url = environment.baseUrl + 'api/magazines';
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

  indexAll(): Observable<Magazine[]> {
    return this.http.get<Magazine[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'MagazineService.indexAll(): error retrieving magazine list: ' + err
          )
        );
      })
    );
  }
}
