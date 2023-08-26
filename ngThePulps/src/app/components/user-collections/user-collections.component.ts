import { Component, OnInit, OnDestroy } from '@angular/core';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-user-collections',
  templateUrl: './user-collections.component.html',
  styleUrls: ['./user-collections.component.css']
})
export class UserCollectionsComponent implements OnInit, OnDestroy {

  user: User = new User();

  ngOnInit(): void {

  }
  ngOnDestroy(): void {

  }

}
