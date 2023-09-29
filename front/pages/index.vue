<template>
    <div v-if="user">
        <p>名前：{{ user.name }}</p>
        <AddTodo @submit="addTodo" /> <!-- ここを解説します -->
        <TodoList :todos="user.todos" /> <!-- ここを解説します -->
    </div>
</template>
  

<script>
import AddTodo from "@/components/AddTodo";
import TodoList from "@/components/TodoList";
import axios from "@/plugins/axios";  // 追加

export default {
    components: {
        AddTodo,
        TodoList,
    },
    data() {
        return {
            todos: [],
        };
    },
    computed: {
        user() {
            return this.$store.state.auth.currentUser;
        }
    },
    created() {
        console.log("API_KEY:", process.env.API_KEY);
    },
    methods: {
        async addTodo(todo) { // 引数をtitleからtodoに変更
            const { data } = await axios.post("/v1/todos", todo); // ボディにtodoオブジェクトをセット
            this.$store.dispatch("auth/setUser", {
                ...this.user,
                todos: [...this.user.todos, data]
            });
        },

    },
};
</script>

  
<style></style>
  