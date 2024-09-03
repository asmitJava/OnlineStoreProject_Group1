import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-payment',
  templateUrl: './payment.component.html',
  styleUrls: ['./payment.component.css']
})
export class PaymentComponent implements OnInit {
  paymentForm!: FormGroup;
  selectedPaymentMethod: string = 'creditCard'; // Default to credit card
  banks: string[] = ['SBI', 'ICICI Bank', 'HDFC', 'Kotak Bank'];

  constructor(private fb: FormBuilder) {}

  ngOnInit(): void {
    this.createForm();
    this.initializeFormValues();
  }

  createForm(): void {
    this.paymentForm = this.fb.group({
      cardHolderName: ['', [Validators.required]],
      cardNumber: ['', [Validators.required, Validators.pattern('^\\d{4} \\d{4} \\d{4} \\d{4}$')]], // Pattern for 16-digit card number with spaces
      expiryDate: ['', [Validators.required, Validators.pattern('^(0[1-9]|1[0-2])\/(\\d{2})$')]], // MM/YY format
      cvv: ['', [Validators.required, Validators.pattern('^\\d{3}$')]], // 3-digit CVV
      bank: ['', []],
      upiId: ['', []],
    });

    // Set initial button state based on default payment method
    this.setSubmitButtonState();
  }

  onPaymentMethodChange(method: string): void {
    this.selectedPaymentMethod = method;
    this.initializeFormValues();
    this.setSubmitButtonState();
  }

  initializeFormValues(): void {
    if (this.selectedPaymentMethod === 'creditCard') {
      this.paymentForm.get('cardHolderName')?.setValidators([Validators.required]);
      this.paymentForm.get('cardNumber')?.setValidators([Validators.required, Validators.pattern('^\\d{4} \\d{4} \\d{4} \\d{4}$')]);
      this.paymentForm.get('expiryDate')?.setValidators([Validators.required, Validators.pattern('^(0[1-9]|1[0-2])\/(\\d{2})$')]);
      this.paymentForm.get('cvv')?.setValidators([Validators.required, Validators.pattern('^\\d{3}$')]);

      this.paymentForm.get('bank')?.clearValidators();
      this.paymentForm.get('upiId')?.clearValidators();
    } else if (this.selectedPaymentMethod === 'netBanking') {
      this.paymentForm.get('cardHolderName')?.clearValidators();
      this.paymentForm.get('cardNumber')?.clearValidators();
      this.paymentForm.get('expiryDate')?.clearValidators();
      this.paymentForm.get('cvv')?.clearValidators();

      this.paymentForm.get('bank')?.setValidators([Validators.required]);
      this.paymentForm.get('upiId')?.clearValidators();
    } else if (this.selectedPaymentMethod === 'upi') {
      this.paymentForm.get('cardHolderName')?.clearValidators();
      this.paymentForm.get('cardNumber')?.clearValidators();
      this.paymentForm.get('expiryDate')?.clearValidators();
      this.paymentForm.get('cvv')?.clearValidators();

      this.paymentForm.get('bank')?.clearValidators();
      this.paymentForm.get('upiId')?.setValidators([Validators.required]);
    } else if (this.selectedPaymentMethod === 'cod') {
      this.paymentForm.get('cardHolderName')?.clearValidators();
      this.paymentForm.get('cardNumber')?.clearValidators();
      this.paymentForm.get('expiryDate')?.clearValidators();
      this.paymentForm.get('cvv')?.clearValidators();

      this.paymentForm.get('bank')?.clearValidators();
      this.paymentForm.get('upiId')?.clearValidators();
    }

    // Update the form's validation state
    this.paymentForm.updateValueAndValidity();
  }

  setSubmitButtonState(): void {
    const isCreditCardSelected = this.selectedPaymentMethod === 'creditCard';
    const isFormValid = this.paymentForm.valid;
    this.paymentForm.controls['cardHolderName'].updateValueAndValidity();
    this.paymentForm.controls['cardNumber'].updateValueAndValidity();
    this.paymentForm.controls['expiryDate'].updateValueAndValidity();
    this.paymentForm.controls['cvv'].updateValueAndValidity();


    const isSubmitEnabled = isCreditCardSelected && isFormValid;
    this.paymentForm.updateValueAndValidity();
    this.paymentForm.controls['cardHolderName'].setValidators(isSubmitEnabled ? [Validators.required] : []);
    this.paymentForm.controls['cardNumber'].setValidators(isSubmitEnabled ? [Validators.required, Validators.pattern('^\\d{4} \\d{4} \\d{4} \\d{4}$')] : []);
    this.paymentForm.controls['expiryDate'].setValidators(isSubmitEnabled ? [Validators.required, Validators.pattern('^(0[1-9]|1[0-2])\/(\\d{2})$')] : []);
    this.paymentForm.controls['cvv'].setValidators(isSubmitEnabled ? [Validators.required, Validators.pattern('^\\d{3}$')] : []);
  }

  onSubmit(): void {
    if (this.paymentForm.valid) {

      Swal.fire({
        icon: 'success',
        title: 'Payment Successful',
        text: 'Thank you! Your payment has been processed successfully.',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'OK'
    }).then((result) => {
        if (result.isConfirmed) {

            window.location.href = '/search';
        }
    });

    } else {
      alert('Please fill out the form correctly.');
    }
  }
}
