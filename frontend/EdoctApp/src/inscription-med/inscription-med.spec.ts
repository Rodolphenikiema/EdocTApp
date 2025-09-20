import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InscriptionMed } from './inscription-med';

describe('InscriptionMed', () => {
  let component: InscriptionMed;
  let fixture: ComponentFixture<InscriptionMed>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [InscriptionMed]
    })
    .compileComponents();

    fixture = TestBed.createComponent(InscriptionMed);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
