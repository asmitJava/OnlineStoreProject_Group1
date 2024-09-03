import { Component, OnInit } from '@angular/core';
import { ActivatedRoute,Router } from '@angular/router';
import { ApiService } from '../api.service';
@Component({
  selector: 'app-product-details',
  templateUrl: './product-details.component.html',
  styleUrls: ['./product-details.component.css']
})
export class ProductDetailsComponent implements OnInit {
  product: any;
   selectedImage: string | undefined;
   staticImages = [
    { id: 1, url: 'assets/iphone.jpg' },
    { id: 9, url: 'assets/laptop3.jpg' },
    { id: 10, url: 'assets/earbuds2.jpg' },
    { id: 4, url: 'assets/TV3.jpg' },
   { id: 5, url: 'assets/watch.jpg' },
    { id: 6, url: 'assets/shoe.jpg' },
   {id: 11,url: 'assets/Mobile1.jpg'},
   {id: 12, url: 'assets/Mobile2.jpg'},
   {id: 13, url:'assets/Laptop4.jpg'},
   { id: 14, url: 'assets/TV4.jpg' },
  ];
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private productService: ApiService
  ) {}

  ngOnInit() {

    // const productId = this.route.snapshot.paramMap.get('id');


  // this.product = this.getStaticProductDetails()
  // this.selectedImage = this.product.images[0];
  this.route.paramMap.subscribe(params => {
    const productId = Number(params.get('id'));  // Get the product ID from route parameters
    if (productId) {
      this.GetProduct(productId);  // Fetch product details using the obtained ID
    }
  });
  }


  GetProduct(productId: number): void {
    this.productService.getProductById(productId).subscribe(
      product => {
        this.product = product;
        // Uncomment and modify this line if you have images array in the product data
        // this.selectedImage = this.product.images[0];
        this.setStaticImage(product.id);
      },
      error => {
        console.error('Error fetching product details', error);
      }
    );
  }

  setStaticImage(productId: number): void {
    const matchedImage = this.staticImages.find(image => image.id === productId);
    if (matchedImage) {
      this.selectedImage = matchedImage.url;
    } else {
      this.selectedImage = 'assets/images/default.jpg'; // Fallback image if no match is found
    }
  }
  // private getStaticProductDetails() {
  //   return {
  //     id: 'PROD001',
  //     name: 'Premium Wireless Bluetooth Headphones',
  //     images: [
  //       'assets\images\b1.jpg'
  //     ],
  //     ratingCount: 1234,
  //     rating: 4.5,
  //     price: 15999,
  //     originalPrice: 19999,
  //     discount: 20,
  //     description: 'Experience crystal-clear audio with our Premium Wireless Bluetooth Headphones. These over-ear headphones offer superior sound quality, active noise cancellation, and long-lasting comfort for extended listening sessions.',
  //     features: [
  //       'High-Resolution Audio with 40mm drivers',
  //       'Active Noise Cancellation technology',
  //       'Up to 30 hours of battery life',
  //       'Quick charge: 10 min charge for 5 hours playback',
  //       'Bluetooth 5.0 with multipoint connection',
  //       'Touch controls for easy operation',
  //       'Voice assistant compatible (Siri, Google Assistant, Alexa)',
  //       'Foldable design with premium carry case'
  //     ],
  //     specifications: [
  //       { name: 'Brand', value: 'AudioTech' },
  //       { name: 'Model', value: 'AT-WH2000' },
  //       { name: 'Color', value: 'Midnight Black' },
  //       { name: 'Connectivity', value: 'Wireless & Wired' },
  //       { name: 'Driver Size', value: '40mm' },
  //       { name: 'Frequency Response', value: '20Hz - 40kHz' },
  //       { name: 'Impedance', value: '32 Ohm' },
  //       { name: 'Weight', value: '250g' }
  //     ],
  //     inStock: true,
  //     estimatedDelivery: '2-3 business days',
  //     warranty: '1 year manufacturer warranty'
  //   };
  // }

  setSelectedImage(image: string) {
    this.selectedImage = image;
  }

  addToCart() {
    // Implement add to cart functionality
    console.log('Product added to cart');
  }

  buyNow() {
    // Implement buy now functionality
   this.router.navigate(['/payment'])
  }
}
