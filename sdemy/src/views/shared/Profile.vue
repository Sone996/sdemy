<template>
	<div class="profile flex flex-col w-full h-full">
		<div v-if="userData" class="flex flex-col items-start p-6 text-xl border-b">
			<span>Name: {{userData.name}}</span>
			<span>Surname: {{userData.surname}}</span>
			<span>Email: {{userData.email}}</span>
			<span>Role: {{userData.role}}</span>
		</div>
		<div class="flex flex-col h-full">
			<Professor-profile-component v-if="loggedUser.role === 'teacher'"></Professor-profile-component>
			<User-profile-component v-else></User-profile-component>
		</div>
	</div>
</template>

<script>
import ProfessorProfileComponent from '../../components/professorComponents/ProfesorProfileComponent';
import UserProfileComponent from '../../components/userComponents/UserProfileComponent';

export default {
	name: "profile",
	components: {
		ProfessorProfileComponent,
		UserProfileComponent,
	},
	data() {
		return {};
	},
	mounted() {
		if (!this.$route.query.id) {
			this.$router.push("/");
		}
		this.initLoad();
	},
	methods: {
		initLoad() {
			if(!this.userData) {
				this.$store.dispatch('userStore/goProfile', this.loggedUser.id).then(() => {
					this.closeLoader();
				}).catch(() => {
					this.closeLoader();
				})
			}
			this.closeLoader();
		},
		closeLoader() {
			this.$store.commit('appStore/setState', {
					prop: 'loader',
					value: false
				})
		},
	},
	computed: {
		userData() {
			return this.$store.getters["userStore/getState"]("profileData");
		},
		loggedUser() {
            return this.$store.getters["authStore/getState"]("loggedUser");
        },
	},
	watch: {},
};
</script>

<style></style>
