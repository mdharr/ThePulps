import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ArtistsComponent } from './components/artists/artists.component';
import { AuthorsComponent } from './components/authors/authors.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { MagazineDetailsComponent } from './components/magazine-details/magazine-details.component';
import { MagazinesAllComponent } from './components/magazines-all/magazines-all.component';
import { MagazinesComponent } from './components/magazines/magazines.component';
import { PublicationDetailsComponent } from './components/publication-details/publication-details.component';
import { PublicationsComponent } from './components/publications/publications.component';
import { StoriesAllComponent } from './components/stories-all/stories-all.component';
import { StoriesComponent } from './components/stories/stories.component';
import { StoryDetailsComponent } from './components/story-details/story-details.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'publications', component: PublicationsComponent },
  { path: 'publications/:publicationId', component: PublicationDetailsComponent },
  // url endpoint stretch goal
  // { path: 'publications/:publicationName', component: PublicationDetailsComponent },
  { path: 'publications/:publicationId/magazines', component: MagazinesComponent },
  { path: 'publications/:publicationId/magazines/:magazineId', component: MagazineDetailsComponent },
  { path: 'publications/:publicationId/magazines/:magazineId/stories', component: StoriesComponent },
  { path: 'publications/:publicationId/magazines/:magazineId/stories/:storyId', component: StoryDetailsComponent },
  { path: 'magazines', component: MagazinesAllComponent },
  { path: 'magazines/:magazineId', component: MagazineDetailsComponent },
  { path: 'magazines/:magazineId/stories', component: StoriesComponent },
  { path: 'magazines/:magazineId/stories/:storyId', component: StoryDetailsComponent },
  { path: 'stories', component: StoriesAllComponent },
  { path: 'stories/:storyId', component: StoryDetailsComponent },
  { path: 'authors', component: AuthorsComponent },
  { path: 'artists', component: ArtistsComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
