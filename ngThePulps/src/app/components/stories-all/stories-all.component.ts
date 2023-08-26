import { Component, inject } from '@angular/core';
import { Subscription } from 'rxjs';
import { Story } from 'src/app/models/story';
import { StoryService } from 'src/app/services/story.service';

@Component({
  selector: 'app-stories-all',
  templateUrl: './stories-all.component.html',
  styleUrls: ['./stories-all.component.css']
})
export class StoriesAllComponent {
  stories: Story[] = [];

  private storiesSubscription: Subscription | undefined;

  storyService = inject(StoryService);

  ngOnInit(): void {

    this.storiesSubscription = this.storyService.indexAll().subscribe({
      next: (stories) => {
        this.stories = stories;
      },
      error: (fail) => {
        console.error('Error getting stories');
        console.error(fail);
      }
    });
  }
}
