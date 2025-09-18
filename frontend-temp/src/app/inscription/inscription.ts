import { Component } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { NgClass, NgIf } from '@angular/common';
import { ApiService, LoginResponse } from '../services/api.service';

@Component({
  selector: 'app-inscription',
  standalone: true,
  imports: [ReactiveFormsModule, NgClass, NgIf],
  templateUrl: './inscription.html',
  styleUrl: './inscription.css'
})
export class Inscription {
  registerForm: FormGroup;
  isLoading = false;
  errorMessage = '';
  successMessage = '';

  constructor(
    private fb: FormBuilder,
    private router: Router,
    private apiService: ApiService
  ) {
    this.registerForm = this.fb.group({
      prenom: ['', [Validators.required, Validators.minLength(2)]],
      nom: ['', [Validators.required, Validators.minLength(2)]],
      mail: ['', [Validators.required, Validators.email]],
      age: ['', [Validators.required, Validators.min(1), Validators.max(120)]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', [Validators.required]]
    }, { validators: this.passwordMatchValidator });
  }

  passwordMatchValidator(form: FormGroup) {
    const password = form.get('password');
    const confirmPassword = form.get('confirmPassword');
    
    if (password && confirmPassword && password.value !== confirmPassword.value) {
      confirmPassword.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    }
    
    return null;
  }

  onSubmit() {
    if (this.registerForm.valid) {
      this.isLoading = true;
      this.errorMessage = '';
      this.successMessage = '';
      
      const userData = {
        prenom: this.registerForm.value.prenom,
        nom: this.registerForm.value.nom,
        mail: this.registerForm.value.mail,
        age: parseInt(this.registerForm.value.age),
        password: this.registerForm.value.password
      };

      this.apiService.register(userData).subscribe({
        next: (response: LoginResponse) => {
          this.isLoading = false;
          if (response.success) {
            this.successMessage = 'Inscription réussie ! Redirection vers la connexion...';
            setTimeout(() => {
              this.router.navigateByUrl('/connexion');
            }, 2000);
          } else {
            this.errorMessage = response.message;
          }
        },
        error: (error) => {
          this.isLoading = false;
          this.errorMessage = 'Erreur lors de l\'inscription. Veuillez réessayer.';
          console.error('Erreur d\'inscription:', error);
        }
      });
    } else {
      this.markFormGroupTouched();
    }
  }

  private markFormGroupTouched() {
    Object.keys(this.registerForm.controls).forEach(key => {
      const control = this.registerForm.get(key);
      control?.markAsTouched();
    });
  }

  allerVersConnexion() {
    this.router.navigateByUrl('/connexion');
  }

  // Getters pour faciliter l'accès aux contrôles dans le template
  get prenom() { return this.registerForm.get('prenom'); }
  get nom() { return this.registerForm.get('nom'); }
  get mail() { return this.registerForm.get('mail'); }
  get age() { return this.registerForm.get('age'); }
  get password() { return this.registerForm.get('password'); }
  get confirmPassword() { return this.registerForm.get('confirmPassword'); }
}
