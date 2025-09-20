import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Welcom } from './welcom';

describe('Welcom', () => {
  let component: Welcom;
  let fixture: ComponentFixture<Welcom>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Welcom]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Welcom);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
