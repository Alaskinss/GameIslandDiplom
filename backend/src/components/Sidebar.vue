<template>
  <div class="min-w-[160px] w-[160px]  transition-all bg-indigo-700 text-white py-4 px-2">
    <router-link :to="{name: 'app.dashboard'}"
                 class="flex items-center p-2 rounded transition-colors hover:bg-black/30">
      <span class="mr-2 text-gray-300">
        <HomeIcon class="w-5"/>
      </span>
      <span class="text-xs">
        Панель 
      </span>
    </router-link>
    <router-link :to="{name: 'app.products'}"
                 class="flex items-center p-2 rounded transition-colors hover:bg-black/30">
      <span class="mr-2 text-gray-300">
        <ViewListIcon class="w-5"/>
      </span>
      <span class="text-xs">
        Товары
      </span>
    </router-link>
    <router-link :to="{name: 'app.orders'}"
                 class="flex items-center p-2 rounded transition-colors hover:bg-black/30">
      <span class="mr-2 text-gray-300">
        <ViewListIcon class="w-5"/>
      </span>
      <span class="text-xs">
        Заказы
      </span>
    </router-link>
    <router-link :to="{name: 'app.users'}"
                 class="flex items-center p-2 rounded transition-colors hover:bg-black/30">
      <span class="mr-2 text-gray-300">
        <UsersIcon class="w-5"/>
      </span>
      <span class="text-xs">
        Пользователи
      </span>
    </router-link>
    <router-link :to="{name: 'app.customers'}"
                 class="flex items-center p-2 rounded transition-colors hover:bg-black/30">
      <span class="mr-2 text-gray-300">
        <UserGroupIcon class="w-5"/>
      </span>
      <span class="text-xs">
        Покупатели
      </span>
    </router-link>
    
  </div>
</template>

<script setup>
  import {HomeIcon, UserGroupIcon, UsersIcon, ViewListIcon, ChartBarIcon} from '@heroicons/vue/outline'
</script>

<style scoped>

</style>
