import { Component, OnInit, OnDestroy, inject } from '@angular/core';
import { Subscription, tap } from 'rxjs';
import { Collection } from 'src/app/models/collection';
import { Story } from 'src/app/models/story';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { MagazineService } from 'src/app/services/magazine.service';
import { StoryService } from 'src/app/services/story.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-user-collections',
  templateUrl: './user-collections.component.html',
  styleUrls: ['./user-collections.component.css']
})
export class UserCollectionsComponent implements OnInit, OnDestroy {

  loggedInUser: User = new User();
  collections: Collection[] = [];
  stories: Story[] = [];
  dataLoaded = false;

  private loggedInUserSubscription: Subscription | undefined
  private userSubscription: Subscription | undefined

  authService = inject(AuthService);
  userService = inject(UserService);
  magazineService = inject(MagazineService);
  storyService = inject(StoryService);

  ngOnInit(): void {

      this.loadCollectionsData();

    // this.userSubscription = this.userService.indexUserCollections(this.loggedInUser.id).subscribe({
    //   next: (collections) => {
    //     this.collections = collections;
    //   },
    //   error: (error) => {
    //     console.log('Error getting user collections');
    //     console.log(error);
    //   },
    // });
  }

  ngOnDestroy(): void {

  }

  navigateToStoryAnchor(story: any): void {
    this.magazineService.findByStoryId(story.id).subscribe(
      (magazine: any) => {
        console.log('Magazine ID:', magazine.id);

        this.storyService.getStoryAnchorURL(story.id, magazine.id).subscribe(
          (url: string) => {
            console.log('Navigating to story anchor in magazine:', url);
            window.open(url, '_blank');
          },
          (error) => {
            console.error('Error navigating to story anchor in magazine', error);
          }
        );
      },
      (error) => {
        console.error('Error retrieving magazine or magazineId', error);
      }
    );
  }

  loadCollectionsData(): void {



    this.loggedInUserSubscription = this.authService.getLoggedInUser().pipe(
      tap(user => {
        this.loggedInUser = user;
        console.log("User " + this.loggedInUser.username);

      })
      ).subscribe({
        error: (error) => {
          console.log('Error getting loggedInUser Profile Component');
          console.log(error);
        },
      });

    this.userSubscription = this.userService.indexUserCollections(this.loggedInUser.id).subscribe({
      next: (collections) => {
        this.collections = collections;
      },
      error: (error) => {
        console.log('Error getting user collections');
        console.log(error);
      },
    });
    this.dataLoaded = true;
  }
}
