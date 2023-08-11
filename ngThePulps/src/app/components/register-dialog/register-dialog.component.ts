import { Component } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { DialogService } from 'src/app/services/dialog.service';

@Component({
  selector: 'app-register-dialog',
  templateUrl: './register-dialog.component.html',
  styleUrls: ['./register-dialog.component.css']
})
export class RegisterDialogComponent {

  newUser: User = new User();

  constructor(private authService: AuthService,
              private router: Router,
              private dialogRef: MatDialogRef<RegisterDialogComponent>,
              private snackBar: MatSnackBar
              ) {}

  register(newUser: User): void {
    console.log('Registering user:');
    console.log(newUser);
    this.authService.register(newUser).subscribe({
      next: (registeredUser) => {
        this.authService.login(newUser.username, newUser.password).subscribe({
          next: (loggedInUser) => {
            this.dialogRef.close();
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

  dismissDialog() {
    this.dialogRef.close();
  }

}
