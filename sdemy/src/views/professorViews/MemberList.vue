<template>
	<div class="member-list flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>My Students</span>
		</div>
		<div class="flex w-full justify-center mt-16">
			<simple-table @singleView="singleView" :model='myStudents' :titles='titles'></simple-table>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
export default {
	name: "member-list",
	components: {
		simpleTable,
	},
	data() {
		return {
			titles: ['Id', 'Student', 'Course', 'Date of Start'],
		};
	},
	mounted() {
		this.fetchMyStudents();
	},
	methods: {
		fetchMyStudents() {
			this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: true
					})
            this.$store.dispatch('adminStore/fetchMyStudents').then(() => {
                this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					})
            }).catch(() => {
                this.$store.commit('appStore/setState', {
						prop: 'loader',
						value: false
					})
            });
		},
		singleView(item) {
			this.$store.commit('appStore/setState', {
				prop: 'loader',
				value: true
			});
			this.$router.push({ path: '/profile', query: { id: item.user_id } })
		}
	},
	computed: {
		myStudents() {
			return this.$store.getters['adminStore/getState']('myStudents');
		}
	},
	watch: {},
};
</script>

<style></style>
