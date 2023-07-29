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

@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    PublicationsComponent,
    MagazinesComponent,
    StoriesComponent,
    PublicationDetailsComponent,
    MagazineDetailsComponent,
    StoryDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
