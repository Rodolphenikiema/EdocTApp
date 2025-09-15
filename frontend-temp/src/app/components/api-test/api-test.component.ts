import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ApiService } from '../../services/api.service';

@Component({
  selector: 'app-api-test',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="api-test">
      <h2>Test de connexion API</h2>
      <button (click)="testApi()">Tester la connexion</button>
      <div *ngIf="apiResponse" class="response">
        <h3>Réponse de l'API:</h3>
        <pre>{{ apiResponse | json }}</pre>
      </div>
      <div *ngIf="error" class="error">
        <h3>Erreur:</h3>
        <p>{{ error }}</p>
      </div>
    </div>
  `,
  styles: [`
    .api-test {
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin: 20px;
    }
    .response {
      margin-top: 20px;
      padding: 10px;
      background-color: #f0f0f0;
      border-radius: 5px;
    }
    .error {
      margin-top: 20px;
      padding: 10px;
      background-color: #ffeeee;
      color: #cc0000;
      border-radius: 5px;
    }
    button {
      padding: 10px 15px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
  `]
})
export class ApiTestComponent implements OnInit {
  apiResponse: any;
  error: string | null = null;

  constructor(private apiService: ApiService) {}

  ngOnInit(): void {}

  testApi(): void {
    this.error = null;
    this.apiService.testConnection().subscribe({
      next: (response) => {
        this.apiResponse = response;
        console.log('API response:', response);
      },
      error: (err) => {
        this.error = `Erreur de connexion: ${err.message}`;
        console.error('API error:', err);
      }
    });
  }
}