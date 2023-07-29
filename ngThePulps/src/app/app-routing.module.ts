import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { MagazineDetailsComponent } from './components/magazine-details/magazine-details.component';
import { MagazinesComponent } from './components/magazines/magazines.component';
import { PublicationDetailsComponent } from './components/publication-details/publication-details.component';
import { PublicationsComponent } from './components/publications/publications.component';
import { StoriesComponent } from './components/stories/stories.component';
import { StoryDetailsComponent } from './components/story-details/story-details.component';

const routes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: 'home' },
  { path: 'home', component: HomeComponent },
  { path: 'publications', component: PublicationsComponent },
  { path: 'publications/:publicationId', component: PublicationDetailsComponent },
  { path: 'publications/:publicationId/magazines', component: MagazinesComponent },
  { path: 'publications/:publicationId/magazines/:magazineId', component: MagazineDetailsComponent },
  { path: 'publications/:publicationId/magazines/:magazineId/stories', component: StoriesComponent },
  { path: 'publications/:publicationId/magazines/:magazineId/stories/:storyId', component: StoryDetailsComponent },
  { path: 'magazines', component: MagazinesComponent },
  { path: 'magazines/:magazineId', component: MagazineDetailsComponent },
  { path: 'magazines/:magazineId/stories', component: StoriesComponent },
  { path: 'magazines/:magazineId/stories/:storyId', component: StoryDetailsComponent },
  { path: 'stories', component: StoriesComponent },
  { path: 'stories/:storyId', component: StoryDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
