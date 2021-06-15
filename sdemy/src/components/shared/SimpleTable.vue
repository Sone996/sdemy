<template>
<div class="flex flex-col">
	<div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
		<div class=" py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
			<div class=" shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
				<table class="min-w-full divide-y divide-gray-200">
					<thead class="bg-gray-50">
						<tr>
							<th 
                                v-for="(item, index) in titles" :key="index" scope="col"
                                class=" px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">{{item}}</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item, index) in model" :key="index"
							:class="index % 2 === 0 ? 'bg-gray-100' : 'bg-gray-300'">
							<td v-for="(col, index) in modelCol()" :key="index" class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ item[modelCol()[index]] }}</td>
							<td class=" px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <span class="button bg-darkGreen">Edit</span>
                            </td>
                            <td class=" px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <span class="button bg-darkRed">Delete</span>
                            </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</template>

<script>
  export default {
    name: 'simple-table',
    components: {},
    data() {
      return {};
    },
    props: {
        titles: {
            type: Array,
            required: true,
        },
        model: {
            type: Array,
            required: true,
        }
    },
    mounted() {},
    methods: {
        modelCol() {
            let len = Object.keys(this.model[0]).length;
            let counter = 0;
            let colName = [];
            for (const key in this.model[0]) {
                if (counter <= len) {
                    colName[counter] = key;
                    counter ++;
                }
            }
            return colName;
        }
    },
    computed: {
    },
    watch: {},
  };
</script>

<style></style>
