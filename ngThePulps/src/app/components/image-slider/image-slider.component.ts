import { Component, Input, OnInit } from '@angular/core';
import { Magazine } from 'src/app/models/magazine';

@Component({
  selector: 'app-image-slider',
  templateUrl: './image-slider.component.html',
  styleUrls: ['./image-slider.component.css']
})
export class ImageSliderComponent implements OnInit {
  @Input() magazines: Magazine[] = [];
  private slideWidth = 158.88 * 10;
  private slideCount = 0;
  private maxOffset = 0;
  public offsetX = 0;

  ngOnInit(): void {
    // Calculate the total number of slides and the maximum translation offset
    this.magazines = this.magazines;
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
    // if (this.offsetX < 0) {
    //   this.offsetX = this.maxOffset;
    // }
  }

}
