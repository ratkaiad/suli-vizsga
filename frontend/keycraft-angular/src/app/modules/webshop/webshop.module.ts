import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';

import { WebshopComponent } from './webshop.component';
import { FooldalComponent } from './pages';

@NgModule({
  declarations: [
    WebshopComponent,

    // saját oldalaink deklarációi
    FooldalComponent
  ],
  imports: [
    CommonModule,
    RouterModule.forChild([
      {
        path: '', 
        component: WebshopComponent,
        children: [
          {
            path: '',
            component: FooldalComponent
          }        
        ]
      }
    ])
  ],
})
export class WebshopModule {}
