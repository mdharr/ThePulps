import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { catchError, Observable, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Author } from '../models/author';
import { Story } from '../models/story';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class StoryService {
  private url = environment.baseUrl + 'api/stories';
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

  indexAll(): Observable<Story[]> {
    return this.http.get<Story[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error(
            'StoryService.indexAll(): error retrieving story list: ' + err
          )
        );
      })
    );
  }

  getStoryById(id: number): Observable<Story> {
    return this.http.get<Story>(this.url + '/' + id).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error('StoryService.getStoryById: error retrieving story: ' + err)
        );
      })
    );
  }

  getAuthorsByStoryId(id: number): Observable<Author[]> {
    return this.http.get<Author[]>(this.url + '/' + id + '/authors').pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          () =>
          new Error('StoryService.getAuthorsStoryId: error retrieving story authors: ' + err)
        );
      })
    );
  }

  getStoryAnchorURL(storyId: number, magazineId: number): Observable<string> {
    const endpoint = `${this.url}/${storyId}/navigate-to-magazine/${magazineId}`;
    return this.http.get(endpoint, { responseType: 'text' });
  }

}
