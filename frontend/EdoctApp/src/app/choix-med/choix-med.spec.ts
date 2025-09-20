import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChoixMed } from './choix-med';

describe('ChoixMed', () => {
  let component: ChoixMed;
  let fixture: ComponentFixture<ChoixMed>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ChoixMed]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ChoixMed);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
