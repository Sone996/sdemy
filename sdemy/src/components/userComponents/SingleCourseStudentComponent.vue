<template>
    <div class="single-course-component flex flex-col text-xl w-full">
        <div class="felx flex-col justify-between px-6">
            <div class="flex py-10">
                <textarea v-model="form.comment" class="border resize-none w-full rounded p-3" rows="10" placeholder="Message for professor"></textarea>
            </div>
            <div class="flex">
                <span class="button bg-darkGreen" @click="buyCourse()">BUY</span>
            </div>
        </div>
    </div>
</template>

<script>
import ModalMixin from '../../mixins/ModalMixin';
import { notificationMsg } from "../../services/BaseServices";
  export default {
    name: 'single-course-component',
    components: {
    },
    data() {
      return {
          form: {
              id: null,
              comment: null,
          }
      };
    },
    props: {
        data: {
            type: Object | null,
            required: true,
        },
    },
    mixins: [ModalMixin],
    methods: {
        buyCourse() {
            this.form.id = this.data.id
            this.$store.dispatch('courseStore/buyCourse', this.form).then((res) => {
                this.openModal('notification-modal', {
					errMsg: null,
					successMsg: notificationMsg(res, 'COURSE_APPLYED_SUCCESS'),
				});
                this.form.comment = null;
            }).catch((err) => {
				this.openModal('notification-modal', {
					errMsg: notificationMsg(err),
					successMsg: null,
				});
            });
        },
    },
    computed: {},
    watch: {},
  };
</script>

<style></style>
