import { ComponentFixture, TestBed } from '@angular/core/testing';

import { StoriesAllComponent } from './stories-all.component';

describe('StoriesAllComponent', () => {
  let component: StoriesAllComponent;
  let fixture: ComponentFixture<StoriesAllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ StoriesAllComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(StoriesAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
