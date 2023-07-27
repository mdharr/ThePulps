import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { MagazineHtml } from '../models/magazine-html';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class MagazineHtmlService {
  private url = environment.baseUrl + 'api/magazine-htmls';
  private otherUrl = environment.baseUrl + 'api/magazines';

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

  indexAll(): Observable<MagazineHtml[]> {
    return this.http.get<MagazineHtml[]>(this.url + '/magazine-htmls').pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'MagazineHtmlService.indexAll(): error retrieving magazine html list: ' + err
          )
        );
      })
    );
  }

  getMagazineHtmlByMagazineId(id: number): Observable<MagazineHtml> {
    return this.http.get<MagazineHtml>(this.otherUrl + '/' + id + '/magazine-html').pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error('MagazineHtmlService.getMagazineHtmlByMagazineId: error retrieving magazine html: ' + err)
        );
      })
    );
  }
}
