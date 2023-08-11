import { AfterViewInit, Component, ElementRef, HostListener, inject, OnInit, Renderer2, ViewChild } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ModalDismissReasons, NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Subscription, tap } from 'rxjs';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { DialogService } from 'src/app/services/dialog.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent implements OnInit, AfterViewInit {

  // property init
  title: string = "Dashboard";
  @ViewChild('bannerWrapper', { static: false }) bannerWrapperRef!: ElementRef<HTMLDivElement>;
  @ViewChild('bannerImage', { static: false }) bannerImageRef!: ElementRef<HTMLImageElement>;

  loggedInUser: User = new User();
  isRotated1: boolean = false;
  quickJumpText: string = 'Browse';
  isToolbarFixed = false;

  // subscription declaration
  private loggedInUserSubscription: Subscription | undefined;

  // service injection
  route = inject(ActivatedRoute);
  router = inject(Router);
  authService = inject(AuthService);
  modalService = inject(NgbModal);
  renderer = inject(Renderer2);
  dialogService = inject(DialogService);

  ngOnInit(): void {
    this.authService.getCurrentLoggedInUser().subscribe((user: User) => {
      this.loggedInUser = user;
      // Do something with the logged-in user object, e.g. update UI
    });

    this.authService.getLoggedInUser().subscribe({
      next: (user) => {
        this.loggedInUser = user;
      },
      error: (error) => {
        console.log('Error getting loggedInUser');
        console.log(error);
      },
    });

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

  ngAfterViewInit() {
    // const navbarHeight = this.getNavbarHeight();
    // this.bannerWrapperRef.nativeElement.style.paddingTop = `${navbarHeight}px`;
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

  loggedIn(): boolean {
    return this.authService.checkLogin();
  }

  closeResult: string = '';

  /**
   * Write code on Method
   *
   * @return response()
   */
  open(content:any) {
    this.modalService.open(content, {ariaLabelledBy: 'modal-basic-title'}).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  /**
   * Write code on Method
   *
   * @return response()
   */
  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return  `with: ${reason}`;
    }

  }

  @HostListener('window:scroll', ['$event'])
  onWindowScroll() {
    const bannerHeight = this.bannerWrapperRef.nativeElement.offsetHeight;
    const scrollPosition = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;

    this.isToolbarFixed = scrollPosition >= bannerHeight;
  }

  onImageLoad() {
    console.log('Image loaded');
    console.log('bannerImageRef', this.bannerImageRef); // Check if the reference is correctly selected
    this.renderer.addClass(this.bannerImageRef.nativeElement, 'loaded');
  }

  openLoginDialog() {
    this.dialogService.openLoginDialog();
  }

  openSignupDialog() {
    this.dialogService.openRegisterDialog();
  }

}
