## Installation 
Make sure you have environment setup properly. You will need MySQL, PHP8.1, Node.js and composer.

### установка Laravel + API
1. Run `composer install`
2. Set the encryption key by executing `php artisan key:generate --ansi`
3. Run migrations `php artisan migrate --seed`
4. Start local server by executing `php artisan serve`
5. Open new terminal and navigate to the project root directory
6. Run `npm install`
7. Run `npm run dev` to start vite server for Laravel frontend

### Install Vue.js Admin Panel
1. Navigate to `backend` folder
2. Run `npm install`
3. Copy `backend/.env.example` into `backend/.env`
4. Make sure `VITE_API_BASE_URL` key in `backend/.env` is set to your Laravel API host (Default: http://localhost:8000)
5. Run `npm run dev`
6. Open Vue.js Admin Panel in browser and login with
    ```
    admin@example.com
    admin123
    ```
