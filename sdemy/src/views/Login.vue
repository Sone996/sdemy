<template>
	<div class="flex items-center justify-center h-full w-full">
		<div v-if="!register" class="flex flex-col w-4/12 border h-2/3 p-4">
			<div class="flex justify-center">
				<span class="text-3xl">Login</span>
			</div>
			<div class="flex flex-col justify-center mt-8">
				<span>Email</span>
				<input class="input" type="text" autocomplete="off" v-model="login.email">
			</div>
			<div class="flex flex-col justify-center mt-4">
				<span>Password</span>
				<input class="input" type="password" autocomplete="new-password" v-model="login.password">
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
					<input class="input" type="text" autocomplete="off" v-model="login.name">
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>Last Name</span>
					<input class="input" type="text" autocomplete="off" v-model="login.surname">
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>Email</span>
					<input class="input" type="text" autocomplete="off" v-model="login.email">
				</div>
				<div class="flex flex-col justify-center mt-8">
					<span>Password</span>
					<input class="input" type="password" autocomplete="new-password" v-model="login.password">
				</div>
				<div class="flex mt-8">
					<v-select
						label="name"
            			class="w-1/4"
            			:clearable="false"
            			:options="roleOptions"
            			v-model="role"
            			/>
				</div>
				<div class="flex mt-4 justify-between">
					<div class="button bg-darkRed w-1/3" @click="registerForm()">Go Back</div>
					<div class="button bg-darkGreen w-1/3" @click="registerAction()">Register</div>
				</div>
			</div>
	</div>
</template>

<script>
import ModalMixin from '../mixins/ModalMixin';
import { notificationMsg } from "../services/BaseServices";
import omit from "lodash/omit";
export default {
	data() {
		return {
			login: {
				email: "",
				password: "",
			},
			role: null,
			register: false,
			roleOptions: [
				{
					name: "Teacher",
					value: 'teacher',
				},
				{
					name: "Student",
					value: 'student',
				},
			]
		};
	},
	mixins: [ModalMixin],
	computed: {
	},
	methods: {
		loginAction() {
			this.$store.commit('appStore/setState', {
				prop: 'loader',
				value: true
			})
			this.$store.dispatch('authStore/login', this.login)
			.then((res) => {
				this.openModal('notification-modal', {
					errMsg: null,
					successMsg: notificationMsg(res, 'lOGIN_SUCCESS'),
				});
				if(res.data.role === 'teacher') {
					this.$router.push('/professor-home');
					return;
				} if(res.data.role === 'student') {
					this.$router.push('/home');
					return;
				} else {
					console.log('videcemo jos')
				}
			})
			.catch((err) => {
				this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					})
				this.openModal('notification-modal', {
					errMsg: notificationMsg(err),
					successMsg: null,
				});
			})
		},
		registerForm() {
			this.register = !this.register;
		},
		registerAction() {
			this.$store.commit('appStore/setState', {
				prop: 'loader',
				value: true
			})
			this.login.role = this.role.value;
			this.$store.dispatch('authStore/register', this.login)
			.then((res) => {
				this.login = omit(this.login, ['name', 'surname', 'role']);
				this.openModal('notification-modal', {
					errMsg: null,
					successMsg: notificationMsg(res, 'REGISTER_SUCCESS'),
				});
				this.loginAction();
			})
			.catch((err) => {
				this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					})
				this.openModal('notification-modal', {
					errMsg: notificationMsg(err),
					successMsg: null,
				});
			})
		}
	},
	mounted() {},
};
</script>
