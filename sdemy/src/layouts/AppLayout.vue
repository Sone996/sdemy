<template>
	<div class="flex w-full h-full">
		<div class="flex flex-col h-full bg-gray-500 w-2/12">
			<div class="flex p-16">
				<img src="../assets/images/factoryww.png" alt="">
			</div>
            <div class="flex flex-col text-white font-bold text-lg">
                <span class="my-2">Profile</span>
                <span class="my-2">Home</span>
				<span @click="logout()">Logout</span>
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
	methods: {
		logout() {
			this.$store.dispatch('authStore/logout').then((res) => {
				localStorage.removeItem(TOKEN_LS_NAME);
            	this.$router.push(res)
			}).catch((err) => {
				console.log(err);
			});
		}
	},
	computed: {},
	watch: {},
};
</script>

<style></style>
