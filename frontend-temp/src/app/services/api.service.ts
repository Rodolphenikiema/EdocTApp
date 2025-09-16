import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:8000/api'; // URL de l'API Django

  constructor(private http: HttpClient) { }

  // Exemple de méthode pour tester la connexion
  testConnection(): Observable<any> {
    return this.http.get(`${this.apiUrl}/hello/`);
  }

  // Authentification
  login(credentials: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/auth/login/`, credentials);
  }

  register(userData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/auth/register/`, userData);
  }

  // Gestion des patients
  getPatients(): Observable<any> {
    return this.http.get(`${this.apiUrl}/patients/`);
  }

  // Gestion des médecins
  getDoctors(): Observable<any> {
    return this.http.get(`${this.apiUrl}/doctors/`);
  }

  // Rendez-vous
  getAppointments(): Observable<any> {
    return this.http.get(`${this.apiUrl}/appointments/`);
  }

  createAppointment(appointment: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/appointments/`, appointment);
  }
}