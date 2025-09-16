import { NgClass } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-connexion',
  standalone: true,
  imports: [NgClass],
  templateUrl: './connexion.html',
  styleUrl: './connexion.css'
})
export class Connexion {
  showPassword = false;

  constructor(private router: Router) {}

  allerVersins() {
    this.router.navigateByUrl('/inscription');
  }

  togglePassword() {
    this.showPassword = !this.showPassword;
  }
}
