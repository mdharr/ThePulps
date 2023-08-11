import { Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { LoginDialogComponent } from '../components/login-dialog/login-dialog.component';
import { RegisterDialogComponent } from '../components/register-dialog/register-dialog.component';

@Injectable({
  providedIn: 'root'
})
export class DialogService {
  constructor(private dialog: MatDialog) {}

  openLoginDialog() {
    this.dialog.open(LoginDialogComponent, {
      width: '400px', // Set the desired width
    });
  }

  openRegisterDialog() {
    this.dialog.open(RegisterDialogComponent, {
      width: '400px', // Set the desired width
    });
  }
}
