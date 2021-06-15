<template>
	<div id="app" class="relative w-screen h-screen overflow-hidden flex">
		<loader v-if="toggleLoader"></loader>
		<router-view />
		<!-- modals -->
		<!-- <span class="button bg-green" @click="openNotificationModal()">test</span> -->
		<div v-if="showModal" class="fixed top-0 left-0 h-screen w-screen flex" style="z-index: 2">
    		<div class="flex items-center justify-center w-full">
    			<component :is="getModalObj.name" :model="getModalObj.data" @closeModal="closeModal" />
    		</div>
    		<!-- <div v-if="activeOverlay" class="fixed top-0 left-0 modal-overlay h-screen w-screen flex"></div> -->
    	</div>
	</div>
</template>

<script>
import ModalMixin from './mixins/ModalMixin';
import loader from './components/shared/Lodaer';
import notificationModal from './components/modals/NotificationModal';
export default {
	name: "app",
	components: {
		loader,
		notificationModal,
	},
	data() {
		return {};
	},
	mounted(){
		//console.log(process)
		//console.log('processss', process.env.VUE_APP_API_PATH)
	},
	mixins: [ModalMixin],
	methods: {
		closeModal() {
            this.$store.commit('appStore/setState', {
                prop: 'showModal',
                value: false
            });
            this.$store.commit('appStore/setModalData', {
                modalName: null,
                modalData: null
            });
        },
		// how to open notification
		// openNotificationModal() {
		// 	this.openModal('notification-modal', {
		// 		errMsg: 'error',
		// 		successMsg: null,
		// 	})
		// },
	},
	computed: {
		toggleLoader() {
    		return this.$store.getters['appStore/getState']('loader');
    	},
		showModal() {
            return this.$store.getters['appStore/getState']('showModal');
        },
        activeOverlay() {
            return this.$store.getters['appStore/getState']('activeOverlay');
        },
        getModalObj() {
        return this.$store.getters['appStore/getState']('modalData');
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
.modal-overlay{
    background-color: rgba(0, 0, 0, .9);
  }
</style>
