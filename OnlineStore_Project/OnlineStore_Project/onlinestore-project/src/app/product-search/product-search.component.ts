import { Component, OnInit } from '@angular/core';
import { ApiService } from '../api.service';
import { debounceTime, distinctUntilChanged, switchMap } from 'rxjs/operators';
import { Subject } from 'rxjs';

@Component({
  selector: 'app-product-search',
  templateUrl: './product-search.component.html',
  styleUrls: ['./product-search.component.css']
})
export class ProductSearchComponent implements OnInit {
  searchTerm: string = '';
  searchResults: any[] | null = null;
  private searchTerms = new Subject<string>();


  productImages: { [id: number]: string } = {
    1: 'assets/iphone.jpg',
    9: 'assets/laptop3.jpg',
    10: 'assets/earbuds2.jpg',
    4: 'assets/TV3.jpg',
    5: 'assets/watch.jpg',
    6: 'assets/shoe.jpg',
    11: 'assets/Mobile1.jpg',
    12: 'assets/Mobile2.jpg',
     13: 'assets/Laptop4.jpg',
     14: 'assets/TV4.jpg',
  };

  constructor(private apiService: ApiService) {}

  ngOnInit() {
    this.searchTerms.pipe(
      debounceTime(300),
      distinctUntilChanged(),
      switchMap((term: string) => this.apiService.searchProducts(term))
    ).subscribe(
      (results) => {
        this.searchResults = results;
        console.log(this.searchResults)
      },
      (error) => {
        console.error('Error searching products:', error);
        this.searchResults = [];
      }
    );
  }

  searchProducts(term: string): void {
    if (term.trim()) {
      this.searchTerms.next(term);
    } else {
      this.searchResults = null;  // Reset results when the search term is empty
    }
  }

  getProductImage(productId: number): string {
    return this.productImages[productId] || 'assets/images/default.jpg'; // Default image if no specific image found
  }
}
