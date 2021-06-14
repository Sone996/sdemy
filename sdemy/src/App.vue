<template>
	<div id="app" class="relative w-screen h-screen overflow-hidden flex">
		<loader v-if="toggleLoader"></loader>
		<router-view />
	</div>
</template>

<script>
import loader from './components/shared/Lodaer';
export default {
	name: "app",
	components: {
		loader
	},
	data() {
		return {};
	},
	mounted(){
		//console.log(process)
		//console.log('processss', process.env.VUE_APP_API_PATH)
	},
	methods: {},
	computed: {
		toggleLoader() {
    		return this.$store.getters['appStore/getState']('loader');
    	},
	},
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
