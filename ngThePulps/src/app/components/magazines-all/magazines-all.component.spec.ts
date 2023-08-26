import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MagazinesAllComponent } from './magazines-all.component';

describe('MagazinesAllComponent', () => {
  let component: MagazinesAllComponent;
  let fixture: ComponentFixture<MagazinesAllComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MagazinesAllComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MagazinesAllComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
