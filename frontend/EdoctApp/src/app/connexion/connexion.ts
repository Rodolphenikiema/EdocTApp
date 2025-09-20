import { NgClass } from '@angular/common';
import { Component, input } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-connexion',
  imports: [NgClass],
  templateUrl: './connexion.html',
  styleUrl: './connexion.css'
})

export class Connexion {
     constructor(private router: Router) {}

  allerVersins() {
    this.router.navigateByUrl('/inscription');
  }

  showPassword = false;
  togglePassword() {
    this.showPassword = !this.showPassword;
  }
}
