import { TestBed } from '@angular/core/testing';

import { MagazineHtmlService } from './magazine-html.service';

describe('MagazineHtmlService', () => {
  let service: MagazineHtmlService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MagazineHtmlService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
