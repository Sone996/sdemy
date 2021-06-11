<template>
	<div id="app" class="relative w-screen h-screen overflow-hidden">
		<router-view />
	</div>
</template>

<script>
export default {
	name: "app",
	components: {},
	data() {
		return {};
	},
	methods: {},
	computed: {},
	watch: {},
};
</script>

<style>
#app {
	font-family: Avenir, Helvetica, Arial, sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	text-align: center;
	color: #2c3e50;
}
</style>
