import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HomeComponent } from './components/home/home.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { PublicationsComponent } from './components/publications/publications.component';
import { MagazinesComponent } from './components/magazines/magazines.component';
import { StoriesComponent } from './components/stories/stories.component';
import { PublicationDetailsComponent } from './components/publication-details/publication-details.component';
import { MagazineDetailsComponent } from './components/magazine-details/magazine-details.component';
import { StoryDetailsComponent } from './components/story-details/story-details.component';
import { AuthorsComponent } from './components/authors/authors.component';
import { AuthorDetailsComponent } from './components/author-details/author-details.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatButtonModule } from '@angular/material/button';
import { MatMenuModule } from '@angular/material/menu';
import { MatDialogModule } from '@angular/material/dialog';
import { MatInputModule } from '@angular/material/input';
import { ImageSliderComponent } from './components/image-slider/image-slider.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { RegisterComponent } from './components/register/register.component';
import { FooterComponent } from './components/footer/footer.component';
import { LoginDialogComponent } from './components/login-dialog/login-dialog.component';
import { RegisterDialogComponent } from './components/register-dialog/register-dialog.component';
import { ArtistsComponent } from './components/artists/artists.component';
import { UserCollectionsComponent } from './components/user-collections/user-collections.component';
import { StoriesAllComponent } from './components/stories-all/stories-all.component';

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    PublicationsComponent,
    MagazinesComponent,
    StoriesComponent,
    PublicationDetailsComponent,
    MagazineDetailsComponent,
    StoryDetailsComponent,
    AuthorsComponent,
    AuthorDetailsComponent,
    NavbarComponent,
    ImageSliderComponent,
    LoginComponent,
    LogoutComponent,
    RegisterComponent,
    FooterComponent,
    LoginDialogComponent,
    RegisterDialogComponent,
    ArtistsComponent,
    UserCollectionsComponent,
    StoriesAllComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatButtonModule,
    MatMenuModule,
    MatSnackBarModule,
    MatDialogModule,
    MatInputModule,
    ReactiveFormsModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
