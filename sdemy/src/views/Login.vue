<template>
	<div class="flex items-center justify-center h-full w-full">
		<div v-if="!register" class="flex flex-col w-4/12 border h-2/3 p-4">
			<div class="flex justify-center">
				<span class="text-3xl">Login</span>
			</div>
			<div class="flex flex-col justify-center mt-8">
				<span>Email</span>
				<input class="input" type="text" v-model="login.email">
			</div>
			<div class="flex flex-col justify-center mt-4">
				<span>Password</span>
				<input class="input" type="password" v-model="login.password">
			</div>
			<div class="flex mt-4 justify-between">
				<div class="button bg-blue-500 w-1/3" @click="loginAction()">Login</div>
				<div class="button bg-darkGreen w-1/3" @click="registerForm()">Register</div>
			</div>
		</div>
		<div v-else class="flex flex-col w-4/12 border h-2/3 p-4">
			<div class="flex justify-center">
					<span class="text-3xl">Register</span>
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>First Name</span>
					<input class="input" type="text" v-model="login.nmae">
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>Last Name</span>
					<input class="input" type="text" v-model="login.surename">
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>Email</span>
					<input class="input" type="text" v-model="login.email">
				</div>
				<div class="flex flex-col justify-center mt-4">
					<span>Password</span>
					<input class="input" type="password" v-model="login.password">
				</div>
				<div class="flex mt-4 justify-between">
					<div class="button bg-darkRed w-1/3" @click="registerForm()">Go Back</div>
					<div class="button bg-darkGreen w-1/3" @click="registerAction()">Register</div>
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
			register: false,
		};
	},
	computed: {
	},
	methods: {
		loginAction() {
			this.$store.dispatch('authStore/login', this.login)
			.then((res) => {
				if(res.role === 'teacher') {
					this.$router.push('/professor-home');
					return;
				} if(res.role === 'student') {
					this.$router.push('/home');
					return;
				} else {
					console.log('videcemo jos')
				}
			})
			.catch((err) => {
				console.log('nisam uspeo: ',err);
			})
		},
		registerForm() {
			this.register = !this.register;
		},
		registerAction() {
			console.log(this.login);
		}
	},
	mounted() {},
};
</script>
