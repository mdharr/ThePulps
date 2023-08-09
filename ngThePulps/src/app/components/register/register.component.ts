import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {

  newUser: User = new User();

  constructor(private authService: AuthService,
              private router: Router,
              private modalService: NgbModal) {}

  register(newUser: User): void {
    console.log('Registering user:');
    console.log(newUser);
    this.authService.register(newUser).subscribe({
      next: (registeredUser) => {
        this.authService.login(newUser.username, newUser.password).subscribe({
          next: (loggedInUser) => {
            this.modalService.dismissAll();
            this.router.navigateByUrl('/home');
          },
          error: (problem) => {
            console.error('RegisterComponent.register(): Error logging in user:');
            console.error(problem);
          }
        });
      },
      error: (fail) => {
        console.error('RegisterComponent.register(): Error registering account');
        console.error(fail);
      }
    });
  }

  dismissModal() {
    this.modalService.dismissAll();
  }

}
