import { Component, inject, OnDestroy, OnInit } from '@angular/core';
import { Subscription, tap } from 'rxjs';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.css']
})
export class UserProfileComponent implements OnInit, OnDestroy {

  loggedInUser: User = new User();

  private loggedInUserSubscription: Subscription | undefined;

  authService = inject(AuthService);

  ngOnInit(): void {

    this.loggedInUserSubscription = this.authService.getLoggedInUser().pipe(
      tap(user => {
        this.loggedInUser = user;
      })
    ).subscribe({
      error: (error) => {
        console.log('Error getting loggedInUser Profile Component');
        console.log(error);
      },
    });
  }

  ngOnDestroy(): void {

  }

}
