<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CajasController;
use App\Http\Controllers\CierreController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\DetalleCierreController;
use App\Http\Resources\UserCollection;
use App\Http\Resources\UserResource;
use App\Http\Resources\CajasCollection;
use App\Http\Resources\CierreCollection;
use App\Http\Resources\CierreResource;
use App\Http\Resources\CajasResource;
use App\Http\Resources\DetalleCierreResource;
use App\Models\Caja;
use App\Models\User;
use App\Models\Cierre;
use App\Models\DetalleCierre;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('getusers', function () {
    return new UserCollection(User::all());
});

Route::get('getid/{id}',[UserController::class, 'getUserById']);
Route::post('insertuser',[UserController::class, 'storeUsers']);
Route::put('updateuser/{id}',[UserController::class, 'modifyUsers']);
Route::delete('deleteuser/{id}',[UserController::class, 'eraseUsers']);

/* ---------------------- cajas ------------------------------- */

Route::get('getcajas', function () {
    return new CajasCollection(Caja::paginate());
});

Route::get('getid/{id}',[CajasController::class, 'getCajaById']);
Route::post('insertcajas',[CajasController::class, 'storeCajas']);
Route::put('updatecajas/{id}',[CajasController::class, 'modifyCajas']);
Route::delete('deletecajas/{id}',[CajasController::class, 'eraseCajas']);

/* ---------------------- cierre ------------------------------- */

Route::get('getcierre', fn () => CierreResource::collection(Cierre::all()));
Route::get('getdetalle', fn () => DetalleCierreResource::collection(DetalleCierre::all()));
Route::post('insertcierre',[CierreController::class, 'storeCierre']);
Route::get('getallcierre/{id}',[CierreController::class, 'getFullCierre']);
Route::get('getdetalles/{id}',[DetalleCierreController::class, 'getDetails']);
