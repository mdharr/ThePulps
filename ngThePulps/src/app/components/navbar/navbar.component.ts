import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {

  title: string = "Dashboard";

  loggedInUser: User = new User();

  isRotated1: boolean = false;

  quickJumpText: string = 'Browse';

  private loggedInUserSubscription: Subscription | undefined;

  constructor(
    // private authService: AuthService,
    private route: ActivatedRoute,
    private router: Router
    ) { }

    rotateChevronTop() {
      this.isRotated1 = !this.isRotated1;

    }

    resetRotationState() {
      console.log('reset rotation state function called');

      this.isRotated1 = false;
    }

    menuOpen(){
      console.log("open")
    }

}
