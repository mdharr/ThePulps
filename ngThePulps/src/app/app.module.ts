import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
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
import { MatButtonModule } from '@angular/material/button';
import { MatMenuModule } from '@angular/material/menu';
import { ImageSliderComponent } from './components/image-slider/image-slider.component';

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
    ImageSliderComponent
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
    MatMenuModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
