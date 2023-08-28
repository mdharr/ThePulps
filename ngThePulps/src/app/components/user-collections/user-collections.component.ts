import { Component, OnInit, OnDestroy, inject } from '@angular/core';
import { Subscription, tap } from 'rxjs';
import { Collection } from 'src/app/models/collection';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-user-collections',
  templateUrl: './user-collections.component.html',
  styleUrls: ['./user-collections.component.css']
})
export class UserCollectionsComponent implements OnInit, OnDestroy {

  loggedInUser: User = new User();
  collections: Collection[] = [];

  private loggedInUserSubscription: Subscription | undefined
  private userSubscription: Subscription | undefined

  authService = inject(AuthService);
  userService = inject(UserService);

  ngOnInit(): void {

    this.loggedInUserSubscription = this.authService.getLoggedInUser().pipe(
      tap(user => {
        this.loggedInUser = user;
        console.log("User " + this.loggedInUser.username);
        this.collections = user.collections;
        console.log("Collections " + this.collections);

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
  }

  ngOnDestroy(): void {

  }

}
