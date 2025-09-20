import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { Accueil } from './accueil/accueil';
import { Connexion } from './connexion/connexion';
import { Inscription } from './inscription/inscription';
import { Welcom } from './welcom/welcom';
import { Dashboard } from './dashboard/dashboard';
import { ApercuPatient } from './apercu-patient/apercu-patient';
import { DashboardMe } from './dashboard-me/dashboard-me';
import { InscriptionMed } from './inscription-med/inscription-med';
import { ChoixMed } from './choix-med/choix-med';
import { Discussion } from './discussion/discussion';
import { ApiTestComponent } from './components/api-test/api-test.component';

export const routes: Routes = [
  { path: '', component: Accueil},   // page d'accueil
  { path: 'connexion', component: Connexion }, // autre page
  { path: 'inscription', component: Inscription}, // autre page
  { path: 'welcom', component: Welcom}, // autre page
  { path: 'dashboard', component: Dashboard}, // autre page
  { path: 'Apercupatient', component: ApercuPatient}, // autre page
  {path: 'dashboardme', component: DashboardMe}, // 
  {path: 'InscriptionMed', component: InscriptionMed}, // 
  {path: 'choixMedecins', component: ChoixMed}, // 
  {path: 'Discussion', component:Discussion}, // 
  {path: 'api-test', component: ApiTestComponent} // Composant de test API
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
