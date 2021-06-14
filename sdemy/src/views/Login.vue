<template>
	<div class="flex items-center justify-center h-full w-full">
		<div  class="flex flex-col w-4/12 border h-2/3 p-4">
			<div class="flex justify-center">
				<span class="text-3xl">Login</span>
			</div>
			<div class="flex flex-col justify-center mt-8">
				<span>Email</span>
				<input class="input" type="text" v-model="login.password">
			</div>
			<div class="flex flex-col justify-center mt-4">
				<span>Password</span>
				<input class="input" type="password" v-model="login.email">
			</div>
			<div class="flex mt-4 justify-between">
				<div class="button bg-blue-600 w-1/3" @click="loginAction()">Login</div>
				<div class="button bg-green-500 w-1/3" @click="registerAction()">Register</div>
			</div>
		</div>
	</div>
</template>

<script>
//import { notificationMsg } from "@/services/BaseService";
export default {
	data() {
		return {
			login: {
				email: "",
				password: "",
			},
		};
	},
	computed: {
	},
	methods: {
		loginAction() {
			console.log('login');
			this.$router.push('/home');
		},
		registerAction() {
			console.log('register');
		}
	},
	mounted() {
	},
};
</script>
