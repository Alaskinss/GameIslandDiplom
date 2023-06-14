<x-app-layout>

    <form action="{{ route('password.email') }}" method="post" class="w-[400px] mx-auto p-6 my-16">
        @csrf
        <h2 class="text-2xl font-semibold text-center mb-5">
        Введите свой адрес электронной почты, чтобы сбросить пароль
        </h2>

        <!-- Session Status -->
        <x-auth-session-status class="mb-4" :status="session('status')"/>

        <p class="text-center text-gray-500 mb-6">
            или
            <a
                href="{{ route('login') }}"
                class="text-purple-600 hover:text-purple-500"
            >
            войти с существующей учетной записью
            </a>
        </p>

        <div class="mb-3">
            <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required
                     autofocus placeholder="Enter your Email Address"/>
        </div>
        <button
            class="btn-primary bg-emerald-500 hover:bg-emerald-600 active:bg-emerald-700 w-full"
        >
        Ссылка для сброса пароля электронной почты
        </button>
    </form>
</x-app-layout>
