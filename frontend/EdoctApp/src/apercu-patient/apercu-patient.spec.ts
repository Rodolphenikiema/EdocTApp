import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ApercuPatient } from './apercu-patient';

describe('ApercuPatient', () => {
  let component: ApercuPatient;
  let fixture: ComponentFixture<ApercuPatient>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ApercuPatient]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ApercuPatient);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
