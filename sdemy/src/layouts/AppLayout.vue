<template>
	<div class="flex w-full h-full">
		<div class="flex flex-col h-full bg-gray-500 w-2/12">
			<div class="flex p-16">
				<img src="../assets/images/factoryww.png" alt="logo" class="cursor-pointer" @click="goToHome()">
			</div>
            <div class="flex flex-col text-white font-bold text-lg">
                <span class="my-2 cursor-pointer" @click="goToHome()">Home</span>
                <span class="my-2 cursor-pointer" @click="goToProfile()">Profile</span>
				<span v-if="loggedUser && loggedUser.role === 'teacher'" class="my-2 cursor-pointer" @click="myStudents()">My Students</span>
				<span v-if="loggedUser && loggedUser.role === 'teacher'" class="my-2 cursor-pointer" @click="newCourse()">New Course</span>
				<span v-if="loggedUser && loggedUser.role === 'teacher'" class="my-2 cursor-pointer" @click="CourseList()">Course List</span>
				<span v-if="loggedUser && loggedUser.role === 'teacher'" class="my-2 cursor-pointer" @click="studentAplications()">Student aplications</span>
				<span class="my-2 cursor-pointer" @click="logout()">Logout</span>
            </div>
        </div>
		<div class="flex w-full">
			<router-view />
		</div>
	</div>
</template>

<script>
import { TOKEN_LS_NAME } from "@/constants/constants";
export default {
	name: "app-layout",
	components: {
	},
	data() {
		return {};
	},
	mounted(){
		if(!localStorage.getItem(TOKEN_LS_NAME)) {
			this.$router.push('/login');
		} 
	},
	methods: {
		logout() {
			this.$store.dispatch('authStore/logout').then((res) => {
				localStorage.removeItem(TOKEN_LS_NAME);
            	this.$router.push(res)
			}).catch((err) => {
				console.log(err);
			});
		},
		goToHome() {
			if(this.loggedUser.role === 'teacher') {
				this.$router.push('professor-home');
			}
			if(this.loggedUser.role === 'student') {
				this.$router.push('home');
			}
		},
		goToProfile() {
			this.$store.dispatch('userStore/goProfile', this.loggedUser.id)
				.then(res => {
					this.$router.push({ path: '/profile', query: { id: res.data.id } })
				}).catch(err => {
				});
		},
		newCourse() {
			this.$router.push('/new-course');
		},
		myStudents() {
			this.$router.push('/member-list');
		},
		CourseList() {
			this.$router.push('course-list')
		},
		studentAplications() {
			this.$router.push('student-aplications');
		}
	},
	computed: {
		loggedUser() {
            return this.$store.getters["authStore/getState"]("loggedUser");
        },
	},
	watch: {},
};
</script>

<style></style>
