<x-app-layout>
    <div class="w-[400px] mx-auto py-32">

        <div class="mb-4 text-sm text-gray-600">
            {{ __('Спасибо за регистрацию! Прежде чем начать, не могли бы вы подтвердить свой адрес электронной почты, перейдя по ссылке, которую мы только что отправили вам по электронной почте? Если вы не получили электронное письмо, мы с радостью вышлем вам другое.') }}
        </div>

        @if (session('status') == 'verification-link-sent')
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ __('На адрес электронной почты, который вы указали при регистрации, была отправлена ​​новая ссылка для подтверждения.') }}
            </div>
        @endif

        <div class="mt-4 flex items-center justify-between">
            <form method="POST" action="{{ route('verification.send') }}">
                @csrf

                <div>
                    <x-button>
                        {{ __('Выслать повторно') }}
                    </x-button>
                </div>
            </form>

            <form method="POST" action="{{ route('logout') }}">
                @csrf

                <button type="submit" class="underline text-sm text-gray-600 hover:text-gray-900">
                    {{ __('Выйти') }}
                </button>
            </form>
        </div>
    </div>
</x-app-layout>
