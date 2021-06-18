<template>
	<div class="professor-home flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>My Courses</span>
		</div>
		<div class="flex w-full h-full py-16 pl-5">
            <div class="relative h-full w-3/4">
                <scroll>
			        <simple-table @singleView="singleView" :model='myCourses' :titles='titles'></simple-table>
                </scroll>
            </div>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
import ModalMixin from '../../mixins/ModalMixin';
import { notificationMsg } from "../../services/BaseServices";
export default {
	name: "professor-home",
	components: {
		simpleTable,
	},
	data() {
		return {
			titles: ['Id', 'Name', 'Average Mark', 'Price'],
		};
	},
	mixins: [ModalMixin],
    mounted() {
		this.$store.commit('appStore/setState', {
				prop: 'loader',
				value: true
			});
		this.loggedUser ? this.fetchMyCourses(this.loggedUser.id) : null;
	},
	methods: {
		fetchMyCourses(id) {
			this.$store.dispatch('adminStore/fetchMyCourses', id).then(res => {
				this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					});
			})
			.catch(err => {
				this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					});
				this.openModal('notification-modal', {
					errMsg: notificationMsg(err),
					successMsg: null,
				});
			}
			);
		},
		singleView(item) {
			this.$store.commit('appStore/setState', {
				prop: 'loader',
				value: true
			});
			this.$router.push({ path: '/course', query: { id: item.id } })
		}
	},
	computed: {
		myCourses() {
			return this.$store.getters['adminStore/getState']('myCourses');
		},
		loggedUser() {
			return this.$store.getters['authStore/getState']('loggedUser');
		},
	},
	watch: {},
};
</script>

<style></style>
