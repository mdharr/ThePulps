import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Magazine } from '../models/magazine';
import { Story } from '../models/story';
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

  find(id: number): Observable<Magazine> {
    return this.http.get<Magazine>(`${this.url}/${id}`).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error('MagazineService.find(): error retrieving magazine: ' + err)
        );
      })
    );
  }

  indexStories(id: number): Observable<Story[]> {
    return this.http.get<Story[]>(`${this.url}/${id}/stories`).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
            new Error('MagazineService.indexStories(): error retrieving magazine stories: ' + err)
        );
      })
    );
  }

  findByStoryId(id: number): Observable<Magazine> {
    return this.http.get<Magazine>(this.otherUrl + '/stories/' + id + '/magazine').pipe(
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
