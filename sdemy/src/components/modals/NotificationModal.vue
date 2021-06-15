<template>
	<div id="notification-modal" class="notification-modal w-2/12 flex flex-row absolute text-tiny felx items-center justify-center goIn"
		:class="model.errMsg ? 'bg-red' : 'bg-green'"
	>
		<span :class="model.errMsg ? 'text-darkRed' : 'text-darkGreen'">xxkxkxkxkxkxxkxkxk</span>
	</div>
</template>

<script>
import ModalMixin from "../../mixins/ModalMixin";
export default {
	data() {
		return {};
	},
	props: ["model"],
	mixins: [ModalMixin],
	mounted() {
		setTimeout(() => {
			this.changeClass()
		}, 3000);

	},
	methods: {
		changeClass(){
			document.getElementById('notification-modal').classList.remove("goIn");
			document.getElementById('notification-modal').classList.add("goOut");
			setTimeout(() => {
				this.$emit('closeModal')
				},450)
		}
	},
	computed: {},
	watch: {},
};
</script>

<style lang="scss" scoped>
.notification-modal {
	right: 2%;
	bottom: 2%;
	height: 10%;	
}
.goIn{
	animation: comein 0.5s;
	animation-iteration-count: 1;
  	animation-timing-function: linear;
}
.goOut{
	animation: comeout 0.5s;
	animation-iteration-count: 1;
  	animation-timing-function: linear;
}
@keyframes comein {
  from {opacity: 0;}
  to {opacity: 1;}
}
@keyframes comeout {
  from {opacity: 1;}
  to {opacity: 0;}
}
</style>
