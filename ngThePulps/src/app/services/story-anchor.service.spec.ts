import { TestBed } from '@angular/core/testing';

import { StoryAnchorService } from './story-anchor.service';

describe('StoryAnchorService', () => {
  let service: StoryAnchorService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(StoryAnchorService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
