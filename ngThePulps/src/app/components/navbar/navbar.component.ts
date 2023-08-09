import { AfterViewInit, Component, ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements AfterViewInit {

  title: string = "Dashboard";

  @ViewChild('bannerWrapper', { static: false }) bannerWrapperRef!: ElementRef<HTMLDivElement>;

  loggedInUser: User = new User();

  isRotated1: boolean = false;

  quickJumpText: string = 'Browse';

  private loggedInUserSubscription: Subscription | undefined;

  constructor(
    // private authService: AuthService,
    private route: ActivatedRoute,
    private router: Router
    ) { }

    ngAfterViewInit() {
      // Get the current height of the fixed navbar
      const navbarHeight = this.getNavbarHeight();

      // Set the top margin of the banner wrapper to match the navbar height
      this.bannerWrapperRef.nativeElement.style.paddingTop = `${navbarHeight}px`;
    }

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

    private getNavbarHeight(): number {
      // Replace 'navbarId' with the actual ID of your navbar element
      const navbarElement = document.getElementById('navbarId');
      return navbarElement ? navbarElement.clientHeight : 0;
    }

}
