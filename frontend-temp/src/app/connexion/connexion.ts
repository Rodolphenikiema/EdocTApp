import { NgClass } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { ApiService, LoginResponse } from '../services/api.service';

@Component({
  selector: 'app-connexion',
  standalone: true,
  imports: [NgClass, ReactiveFormsModule],
  templateUrl: './connexion.html',
  styleUrl: './connexion.css'
})
export class Connexion {
  showPassword = false;
  loginForm: FormGroup;
  isLoading = false;
  errorMessage = '';

  constructor(
    private router: Router,
    private fb: FormBuilder,
    private apiService: ApiService
  ) {
    this.loginForm = this.fb.group({
      mail: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]]
    });
  }

  allerVersins() {
    this.router.navigateByUrl('/inscription');
  }

  togglePassword() {
    this.showPassword = !this.showPassword;
  }

  onSubmit() {
    if (this.loginForm.valid) {
      this.isLoading = true;
      this.errorMessage = '';
      
      const credentials = {
        mail: this.loginForm.value.mail,
        password: this.loginForm.value.password
      };

      this.apiService.login(credentials).subscribe({
        next: (response: LoginResponse) => {
          this.isLoading = false;
          if (response.success) {
            // Stocker les informations utilisateur
            localStorage.setItem('user', JSON.stringify(response.user));
            // Rediriger vers le dashboard
            this.router.navigateByUrl('/dashboard');
          } else {
            this.errorMessage = response.message;
          }
        },
        error: (error) => {
          this.isLoading = false;
          this.errorMessage = 'Erreur de connexion. Vérifiez vos identifiants.';
          console.error('Erreur de connexion:', error);
        }
      });
    } else {
      this.markFormGroupTouched();
    }
  }

  private markFormGroupTouched() {
    Object.keys(this.loginForm.controls).forEach(key => {
      const control = this.loginForm.get(key);
      control?.markAsTouched();
    });
  }

  // Getters pour faciliter l'accès aux contrôles dans le template
  get mail() { return this.loginForm.get('mail'); }
  get password() { return this.loginForm.get('password'); }
}
