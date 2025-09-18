import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface User {
  id?: number;
  prenom: string;
  nom: string;
  mail: string;
  age?: number;
}

export interface LoginResponse {
  success: boolean;
  user?: User;
  message: string;
}

export interface Patient {
  utilisateur: User;
  profil?: number;
  dossier_patient: string;
  historique?: string;
}

export interface Docteur {
  utilisateur: User;
  specialite: string;
  nom_hopital_type: string;
}

export interface RendezVous {
  id?: number;
  date: string;
  heure: string;
  statut: string;
  patient?: Patient;
  docteur?: Docteur;
  patient_id?: number;
  docteur_id?: number;
}

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:8000/api';
  private httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient) { }

  // Test de connexion
  testConnection(): Observable<any> {
    return this.http.get(`${this.apiUrl}/hello/`);
  }

  // Authentification
  login(credentials: {mail: string, password: string}): Observable<LoginResponse> {
    return this.http.post<LoginResponse>(`${this.apiUrl}/auth/login/`, credentials, this.httpOptions);
  }

  register(userData: User & {password: string}): Observable<LoginResponse> {
    return this.http.post<LoginResponse>(`${this.apiUrl}/auth/register/`, userData, this.httpOptions);
  }

  // Gestion des utilisateurs
  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.apiUrl}/utilisateurs/`);
  }

  getUser(id: number): Observable<User> {
    return this.http.get<User>(`${this.apiUrl}/utilisateurs/${id}/`);
  }

  // Gestion des patients
  getPatients(): Observable<Patient[]> {
    return this.http.get<Patient[]>(`${this.apiUrl}/patients/`);
  }

  getPatient(id: number): Observable<Patient> {
    return this.http.get<Patient>(`${this.apiUrl}/patients/${id}/`);
  }

  // Gestion des médecins
  getDoctors(): Observable<Docteur[]> {
    return this.http.get<Docteur[]>(`${this.apiUrl}/docteurs/`);
  }

  getDoctor(id: number): Observable<Docteur> {
    return this.http.get<Docteur>(`${this.apiUrl}/docteurs/${id}/`);
  }

  // Rendez-vous
  getAppointments(): Observable<RendezVous[]> {
    return this.http.get<RendezVous[]>(`${this.apiUrl}/rendezvous/`);
  }

  getAppointment(id: number): Observable<RendezVous> {
    return this.http.get<RendezVous>(`${this.apiUrl}/rendezvous/${id}/`);
  }

  createAppointment(appointment: RendezVous): Observable<RendezVous> {
    return this.http.post<RendezVous>(`${this.apiUrl}/rendezvous/`, appointment, this.httpOptions);
  }

  updateAppointment(id: number, appointment: RendezVous): Observable<RendezVous> {
    return this.http.put<RendezVous>(`${this.apiUrl}/rendezvous/${id}/`, appointment, this.httpOptions);
  }

  deleteAppointment(id: number): Observable<any> {
    return this.http.delete(`${this.apiUrl}/rendezvous/${id}/`);
  }

  // Rendez-vous par patient
  getAppointmentsByPatient(patientId: number): Observable<RendezVous[]> {
    return this.http.get<RendezVous[]>(`${this.apiUrl}/rendezvous/by_patient/?patient_id=${patientId}`);
  }

  // Rendez-vous par docteur
  getAppointmentsByDoctor(docteurId: number): Observable<RendezVous[]> {
    return this.http.get<RendezVous[]>(`${this.apiUrl}/rendezvous/by_doctor/?docteur_id=${docteurId}`);
  }
}