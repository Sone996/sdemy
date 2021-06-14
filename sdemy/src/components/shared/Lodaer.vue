<template>
	<div
		class=" loader absolute w-full h-full bg-black bg-opacity-60 flex justify-center items-center">
		<div class="flex img-container justify-center">
			<img class="img animate-pulse" src="../../assets/images/factoryww.png" alt="logo"/>
		</div>
	</div>
</template>

<script>
export default {
	name: "loader",
	components: {},
	data() {
		return {};
	},
	methods: {},
	computed: {},
	watch: {},
};
</script>

<style lang='scss' scoped>
.loader {
	z-index: 2;
	.img-container {
		width: 25%;
		height: 25%;
	}
}
</style>
