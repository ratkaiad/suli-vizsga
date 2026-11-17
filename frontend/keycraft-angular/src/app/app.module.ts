import { NgModule, provideBrowserGlobalErrorListeners } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./modules/webshop/webshop.module').then((m) => m.WebshopModule)
  },
  {
    path: 'admin',
    loadChildren: () => import('./modules/webshop/webshop.module').then((m) => m.WebshopModule)
  },  
  {
    path: '**', redirectTo: 'errors/404', pathMatch: 'full'
  }
];

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule, 
    RouterModule.forRoot(routes), 
    NgbModule
  ],
  providers: [provideBrowserGlobalErrorListeners()],
  bootstrap: [
    AppComponent
  ],
})
export class AppModule {}
