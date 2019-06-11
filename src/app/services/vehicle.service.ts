import { Injectable } from '@angular/core';

import { ApiService } from './api.service';
import { Vehicle } from '../model/vehicle';
import { User } from '../model/user';

@Injectable()
export class VehicleService {

    constructor(private apiService: ApiService) { }

    public getVehicles() {
        return this.apiService.getVehicles();
    }

    public getVehicle(vehicleId: String) {
        return this.apiService.getVehicle(vehicleId);
    }

    public createVehicle(vehicle: Vehicle) {
        return this.apiService.createVehicle(vehicle);
    }

    public updateVehicle(vehicle: Vehicle) {
        return this.apiService.updateVehicle(vehicle);
    }

    public shareVehicle(vehicle: Vehicle, userID: String) {
        return this.apiService.shareVehicle(vehicle, userID)
    }

    public deleteVehicle(vehicleId: String) {
        return this.apiService.deleteVehicle(vehicleId);
    }
}
