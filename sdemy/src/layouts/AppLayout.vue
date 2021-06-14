<template>
	<div class="flex w-full h-full">
		<div class="flex flex-col h-full bg-gray-500 w-2/12">
			<div class="flex p-16">
				<img src="../assets/images/factoryww.png" alt="">
			</div>
            <div class="flex flex-col text-white font-bold text-lg">
                <span class="my-2">Profile</span>
                <span class="my-2">Home</span>
            </div>
        </div>
		<div class="flex w-full">
			<router-view />
		</div>
	</div>
</template>

<script>
export default {
	name: "app-layout",
	components: {
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
