import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { Magazine } from 'src/app/models/magazine';

@Component({
  selector: 'app-image-slider',
  templateUrl: './image-slider.component.html',
  styleUrls: ['./image-slider.component.css']
})
export class ImageSliderComponent implements OnInit, OnChanges {
  @Input() magazines: Magazine[] = [];
  private slideWidth = 158.88;
  private slideCount = 0;
  private maxOffset = 0;
  public offsetX = 0;

  ngOnInit(): void {
    this.calculateSliderValues();

  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['magazines']) {
      this.calculateSliderValues();
      console.log('magazines: ' + this.magazines);
      console.log('slide width: ' + this.slideWidth);
      console.log('slide count: ' + this.slideCount);
      console.log('max offset: ' + this.maxOffset);
      console.log('offsetX: ' + this.offsetX);

    }
  }

  private calculateSliderValues(): void {
    this.slideCount = this.magazines.length;
    this.maxOffset = this.slideWidth * (this.slideCount - 1);
  }

  // Move the slider to the left
  moveLeft(): void {
    this.offsetX += this.slideWidth;
    if (this.offsetX > this.maxOffset) {
      this.offsetX = 0;
    }
  }

  // Move the slider to the right
  moveRight(): void {
    this.offsetX -= this.slideWidth;
    if (this.offsetX > this.slideWidth) {
      this.offsetX = this.maxOffset;
    }
    console.log('magazines: ' + this.magazines);
    console.log('slide width: ' + this.slideWidth);
    console.log('slide count: ' + this.slideCount);
    console.log('max offset: ' + this.maxOffset);
    console.log('offsetX: ' + this.offsetX);
  }

}
