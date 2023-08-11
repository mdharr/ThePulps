import { Component, HostListener } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'ngThePulps';

  showFooter = false;
  // backgroundImageLoaded = false;

  @HostListener('window:scroll')
  onScroll() {
    const windowHeight = 'innerHeight' in window ? window.innerHeight : document.documentElement.offsetHeight;
    const body = document.body;
    const html = document.documentElement;
    const docHeight = Math.max(body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight);
    const windowBottom = windowHeight + window.pageYOffset;

    if (windowBottom >= docHeight) {
      this.showFooter = true;
    } else {
      this.showFooter = false;
    }
  }

  // onBackgroundImageLoad() {
  //   this.backgroundImageLoaded = true;
  //   // You can call a function here to load your components
  //   this.loadComponents();
  // }

  // loadComponents() {
  //   // Load your components here
  // }

}
