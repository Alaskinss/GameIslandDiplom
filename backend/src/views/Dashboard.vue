<template>
  <div class="mb-2 flex items-center justify-between">
    <h1 class="text-3xl font-semibold">Панель</h1>
    <div class="flex items-center">
      <label class="mr-2">Изменить период</label>
      <CustomInput type="select" v-model="chosenDate" @change="onDatePickerChange" :select-options="dateOptions"/>
    </div>
  </div>
  <div class="grid grid-cols-1 md:grid-cols-4 gap-3 mb-4">
    <!--    Active Customers-->
    <div class="animate-fade-in-down bg-white py-6 px-5 rounded-lg shadow flex flex-col items-center justify-center">
      <label class="text-lg font-semibold block mb-2">Активные клиенты</label>
      <template v-if="!loading.customersCount">
        <span class="text-3xl font-semibold">{{ customersCount }}</span>
      </template>
      <Spinner v-else text="" class=""/>
    </div>
    <!--/    Active Customers-->
    <!--    Active Products -->
    <div class="animate-fade-in-down bg-white py-6 px-5 rounded-lg shadow flex flex-col items-center justify-center"
         style="animation-delay: 0.1s">
      <label class="text-lg font-semibold block mb-2">Активные товары</label>
      <template v-if="!loading.productsCount">
        <span class="text-3xl font-semibold">{{ productsCount }}</span>
      </template>
      <Spinner v-else text="" class=""/>
    </div>
    <!--/    Active Products -->
    <!--    Paid Orders -->
    <div class="animate-fade-in-down bg-white py-6 px-5 rounded-lg shadow flex flex-col items-center justify-center"
         style="animation-delay: 0.2s">
      <label class="text-lg font-semibold block mb-2">Оплаченные заказы</label>
      <template v-if="!loading.paidOrders">
        <span class="text-3xl font-semibold">{{ paidOrders }}</span>
      </template>
      <Spinner v-else text="" class=""/>
    </div>
    <!--/    Paid Orders -->
    <!--    Total Income -->
    <div class="animate-fade-in-down bg-white py-6 px-5 rounded-lg shadow flex flex-col items-center"
         style="animation-delay: 0.3s">
      <label class="text-lg font-semibold block mb-2">Общая прибыль</label>
      <template v-if="!loading.totalIncome">
        <span class="text-3xl font-semibold">{{ totalIncome }}</span>
      </template>
      <Spinner v-else text="" class=""/>
    </div>
    <!--/    Total Income -->
  </div>

  

</template>

<script setup>
import {UserIcon} from '@heroicons/vue/outline'
import DoughnutChart from '../components/core/Charts/Doughnut.vue'
import axiosClient from "../axios.js";
import {computed, onMounted, ref} from "vue";
import Spinner from "../components/core/Spinner.vue";
import CustomInput from "../components/core/CustomInput.vue";
import {useStore} from "vuex";

const store = useStore();
const dateOptions = computed(() => store.state.dateOptions);
const chosenDate = ref('all')

const loading = ref({
  customersCount: true,
  productsCount: true,
  paidOrders: true,
  totalIncome: true,
  ordersByCountry: true,
  latestCustomers: true,
  latestOrders: true
})
const customersCount = ref(0);
const productsCount = ref(0);
const paidOrders = ref(0);
const totalIncome = ref(0);
const ordersByCountry = ref([]);
const latestCustomers = ref([]);
const latestOrders = ref([]);

function updateDashboard() {
  const d = chosenDate.value
  loading.value = {
    customersCount: true,
    productsCount: true,
    paidOrders: true,
    totalIncome: true,
    ordersByCountry: true,
    latestCustomers: true,
    latestOrders: true
  }
  axiosClient.get(`/dashboard/customers-count`, {params: {d}}).then(({data}) => {
    customersCount.value = data
    loading.value.customersCount = false;
  })
  axiosClient.get(`/dashboard/products-count`, {params: {d}}).then(({data}) => {
    productsCount.value = data;
    loading.value.productsCount = false;
  })
  axiosClient.get(`/dashboard/orders-count`, {params: {d}}).then(({data}) => {
    paidOrders.value = data;
    loading.value.paidOrders = false;
  })
  axiosClient.get(`/dashboard/income-amount`, {params: {d}}).then(({data}) => {
    totalIncome.value = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 0
    })
      .format(data);
    loading.value.totalIncome = false;
  })
  axiosClient.get(`/dashboard/orders-by-country`, {params: {d}}).then(({data: countries}) => {
    loading.value.ordersByCountry = false;
    const chartData = {
      labels: [],
      datasets: [{
        backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16'],
        data: []
      }]
    }
    countries.forEach(c => {
      chartData.labels.push(c.name);
      chartData.datasets[0].data.push(c.count);
    })
    ordersByCountry.value = chartData
  })

  axiosClient.get(`/dashboard/latest-customers`, {params: {d}}).then(({data: customers}) => {
    latestCustomers.value = customers;
    loading.value.latestCustomers = false;
  })
  axiosClient.get(`/dashboard/latest-orders`, {params: {d}}).then(({data: orders}) => {
    latestOrders.value = orders.data;
    loading.value.latestOrders = false;
  })
}

function onDatePickerChange() {
  updateDashboard()
}

onMounted(() => updateDashboard())
</script>

<style scoped>

</style>
