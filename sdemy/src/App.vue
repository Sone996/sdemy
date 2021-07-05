<template>
	<div id="app" class="relative w-screen h-screen overflow-hidden flex">
		<loader v-if="toggleLoader"></loader>
		<router-view />
		<!-- modals -->
		<!-- <span class="button bg-green" @click="openNotificationModal()">test</span> -->
		<div v-if="showModal" class="fixed top-0 left-0 h-screen w-screen flex" style="z-index: 2">
    		<div class="modal flex items-center justify-center w-full">
    			<component :is="getModalObj.name" :model="getModalObj.data" @closeModal="closeModal" />
    		</div>
    		<div v-if="activeOverlay" class="fixed top-0 left-0 modal-overlay h-screen w-screen flex"></div>
    	</div>
	</div>
</template>

<script>
import ModalMixin from './mixins/ModalMixin';
import loader from './components/shared/Lodaer';
import notificationModal from './components/modals/NotificationModal';
import requrestAcceptModal from './components/modals/RequestAcceptModal';
import { TOKEN_LS_NAME } from "@/constants/constants";
export default {
	name: "app",
	components: {
		loader,
		notificationModal,
		requrestAcceptModal,
	},
	data() {
		return {};
	},
	mounted(){},
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
			this.$store.commit('appStore/setState', {
				prop: 'activeOverlay',
				value: false,
			})
        },
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
	z-index: 1;
    background-color: rgba(0, 0, 0, .6);
  }
  .modal{
	  z-index: 2;
  }
</style>
