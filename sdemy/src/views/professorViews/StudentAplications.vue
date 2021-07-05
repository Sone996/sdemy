<template>
	<div class="student-aplications flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>Students</span>
		</div>
        <div class="flex w-full mt-4">
            <span class="button bg-darkGreen ml-4">Active</span>
            <span class="button bg-darkGreen ml-4">Inactive</span>
        </div>
		<div class="flex w-full justify-center mt-16">
			<simple-table @singleView="singleView" :model='myStudents' :titles='titles'></simple-table>
		</div>
	</div>
</template>

<script>
import simpleTable from '../../components/shared/SimpleTable';
export default {
	name: "student-aplications",
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
            this.$store.dispatch('adminStore/fetchAplicationRequests').then(() => {
            }).catch(() => {
            });
		},
		singleView(item) {
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
