import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { User } from '../models/user';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private url = environment.baseUrl + 'api/users';
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

  indexAll(): Observable<User[]> {
    return this.http.get<User[]>(this.url).pipe(
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

  find(id: number): Observable<User> {
    return this.http.get<User>(`${this.url}/${id}`).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error('MagazineService.find(): error retrieving magazine: ' + err)
        );
      })
    );
  }
}
