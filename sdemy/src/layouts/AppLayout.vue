<template>
	<div class="app-layout flex h-full w-full">
		<div class="flex-col h-full w-2/12 bg-black"></div>
		<div class="flex-col h-full w-10/12">
			<user-dashboard></user-dashboard>
		</div>
	</div>
</template>

<script>
import UserDashboard from '../components/userComponents/UserDashboard';
export default {
	name: "app-layout",
	components: {
		UserDashboard,
	},
	data() {
		return {};
	},
	methods: {},
	computed: {},
	watch: {},
};
</script>

<style></style>
