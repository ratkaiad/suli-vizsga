import { ComponentFixture, TestBed } from '@angular/core/testing';
import { Webshop } from './webshop.component';

describe('Webshop', () => {
  let component: Webshop;
  let fixture: ComponentFixture<Webshop>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [Webshop],
    }).compileComponents();

    fixture = TestBed.createComponent(Webshop);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
