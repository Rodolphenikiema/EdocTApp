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

  // Ajoutez d'autres méthodes selon vos besoins
}