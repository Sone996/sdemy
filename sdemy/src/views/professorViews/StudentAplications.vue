<template>
	<div class="student-aplications flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>Students</span>
		</div>
        <div class="flex w-full mt-4">
            <span class="button bg-darkGreen ml-4" @click="getActive()">Active</span>
            <span class="button bg-darkGreen ml-4" @click="getInactive()">Inactive</span>
        </div>

		<div class="flex flex-col justify-center h-full p-16">
			<div class="relative h-full w-full">
				<scroll>
				    <simple-table @singleView="singleView" :model='model' :titles='titles'></simple-table>
        		</scroll>
			</div>
		</div>




		<!-- <div class="flex w-full justify-center mt-16">
			<simple-table @singleView="singleView" :model='model' :titles='titles'></simple-table>
		</div> -->
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
import ModalMixin from '../../mixins/ModalMixin';

export default {
	name: "student-aplications",
	components: {
		simpleTable,
	},
	data() {
		return {
			titles: ['Student Id', 'COurse Id', 'Accept'],
			model: null,
		};
	},
	mixins: [ModalMixin],
	mounted() {
		this.fetchMyStudents();
		this.aplications ? this.getActive() : null;
	},
	methods: {
		fetchMyStudents() {
            this.$store.dispatch('adminStore/fetchAplicationRequests').then(() => {
            }).catch(() => {
            });
		},
		singleView(item) {
			this.$router.push({ path: '/profile', query: { id: item.user_id } })
		},
		getActive() {
			var active = [];
			var i = 0;
			this.aplications.forEach(aplication => {
				if(aplication.accepted === true) {
					active[i] = aplication;
					i++;
				}
			});
			this.model = active;
		},
		getInactive() {
			var inactive = [];
			var i = 0;
			this.aplications.forEach(aplication => {
				if(aplication.accepted === false) {
					inactive[i] = aplication;
					i++;
				}
			});
			this.model = inactive;
		},
		singleView(item) {
			if(item.accepted === true) {
				this.$store.commit('appStore/setState', {
					prop: 'activeOverlay',
					value: true,
				})
				this.openModal('finishing-course-modal', item);
			} else {
				this.$store.commit('appStore/setState', {
					prop: 'activeOverlay',
					value: true,
				})
				this.openModal('requrest-accept-modal', item);
			}
		}
	},
	computed: {
		aplications() {
			return this.$store.getters['adminStore/getState']('aplicationRequests');
		}
	},
	watch: {},
};
</script>

<style></style>
