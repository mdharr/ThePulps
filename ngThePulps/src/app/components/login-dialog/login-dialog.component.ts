import { Component } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login-dialog',
  templateUrl: './login-dialog.component.html',
  styleUrls: ['./login-dialog.component.css']
})
export class LoginDialogComponent {
  loginUser: User = new User();

  constructor(
    private dialogRef: MatDialogRef<LoginDialogComponent>,
    private authService: AuthService,
    private snackBar: MatSnackBar
  ) {}

  login(loginUser: User) {
    this.authService.login(this.loginUser.username, this.loginUser.password).subscribe({
      next: (loggedInUser) => {
        console.log("Login success");
        this.dialogRef.close();
        this.snackBar.open('Login Success!', 'Dismiss', {
          duration: 4000,
          panelClass: ['mat-toolbar', 'mat-primary'],
          verticalPosition: 'bottom'
        });
      },
      error: (fail) => {
        console.error('Login fail');
        console.error(fail);
        this.snackBar.open('Incorrect username or password', 'Dismiss', {
          duration: 4000,
          panelClass: ['mat-toolbar', 'mat-warn'],
          verticalPosition: 'bottom'
        });
      }
    });
  }

  dismissDialog() {
    this.dialogRef.close();
  }

}
