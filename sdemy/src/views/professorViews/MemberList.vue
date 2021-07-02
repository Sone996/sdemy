<template>
	<div class="member-list flex-col flex w-full">
		<div class="flex border-b py-4 px-4 w-full text-xl font-bold">
			<span>My Students</span>
		</div>
		<div class="flex w-full justify-center mt-16">
			<simple-table :model='model' :titles='titles'></simple-table>
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
			model: [
                { name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com', course: 'JS' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com', course: 'Vue' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com', course: 'JS' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com', course: 'JS' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com', course: 'Vue' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com', course: 'JS' },
				{ name: 'Jane Cooper', title: 'Regional Paradigm Technician', role: 'Admin', email: 'jane.cooper@example.com', course: 'CSS' },
                { name: 'Cody Fisher', title: 'Product Directives Officer', role: 'Owner', email: 'cody.fisher@example.com', course: 'JS' },
            ],
			titles: ['Name', 'Title', 'Role', 'Email', 'Course'],
		};
	},
	mounted() {},
	methods: {},
	computed: {},
	watch: {},
};
</script>

<style></style>
