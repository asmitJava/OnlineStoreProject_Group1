import { Injectable } from '@angular/core';
import { HttpClient , HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:8081/api';

  constructor(private http: HttpClient) { }

  login(username: string, password: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/login`, { username, password });
  }

  register(user: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/users/register`, user);
  }

  searchProducts(query: string): Observable<any> {
    return this.http.get(`${this.apiUrl}/products/search?query=${query}`);
  }

  getProductById(id: any): Observable<any> {
    return this.http.get(`${this.apiUrl}/products/${id}`);

  }
}
