import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-accueil',
  standalone: true,
  imports: [],
  templateUrl: './accueil.html',
  styleUrl: './accueil.css'
})
export class Accueil {

   constructor(private router: Router) {}

  allerVersConnexion() {
    this.router.navigateByUrl('/connexion');
  }

}