import { Component } from '@angular/core';
import { ApiService } from '../api.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  username: string = '';
  password: string = '';
  email: string = '';
  errorMessage: string = '';

  constructor(private apiService: ApiService, private router: Router) { }

  onSubmit() {
    const user = {
      username: this.username,
      password: this.password,
      email: this.email
    };

    this.apiService.register(user).subscribe(
      (response) => {
        // Handle successful registration
        // console.log('Registration successful', response);
        // this.router.navigate(['/login']);


        Swal.fire({
          icon: 'success',
          title: 'Registered Successfully',
          text: 'You have successfully created an account!',
          confirmButtonColor: '#3085d6',
          confirmButtonText: 'OK'
      }).then((result) => {
          if (result.isConfirmed) {

              window.location.href = '/login';
          }
      });
      },
      (error) => {
        console.error('Registration error', error);
        this.errorMessage = 'Registration failed. User might already exist.';
      }
    );
  }
}
