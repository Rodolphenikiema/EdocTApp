import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardMe } from './dashboard-me';

describe('DashboardMe', () => {
  let component: DashboardMe;
  let fixture: ComponentFixture<DashboardMe>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardMe]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardMe);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
