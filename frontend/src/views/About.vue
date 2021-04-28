<template>
  <div>
    <div v-if="userWorkouts.length < 3 && userWorkouts">
      <p>Adicione treinos ao seu perfil para melhorar sua organização!</p>
      <p>Para adicionar um treino, basta colocar o nome dele na caixa de seleção abaixo e confirmar com o botao</p>
      <input type="text" placeholder="Digite o nome exato de um algum dos treinos" ref="addWorkout">
      <button type="submit" @click="postUserWorkout()">Adicionar</button>
    </div>
    <div>
      <ul v-for="(wk, index) of userWorkouts" :key="index" class='list-group mr-5 ml-5'>
        <li class="list-group-item d-flex justify-content-between align-items-center mt-3">
          {{ wk }}
          <button class="btn btn-danger ml-5 btn-delete pl-3 pr-3 pt-2 pb-2" @click="deleteUserWorkout(index)">Excluir</button>
        </li>
      </ul>
      <button type="submit" @click="sendUserWorkout()" v-if="addUserWorkouts.length >= 3 && originalWorkout != userWorkouts">Confirmar</button>
    </div>
    <p v-if="addUserWorkouts">
      <ul v-for="userWorkout of addUserWorkouts" :key="userWorkout" id="workout-list">
        <li>{{ userWorkout }}</li>
      </ul>
      <button type="submit" @click="sendUserWorkout()" v-if="addUserWorkouts.length === 3">Confirmar</button>
    </p>
    <p v-else>
      <span>O usuário ainda não tem treinos cadastrados</span>
    </p>
    <br />
    <br />
    <!-- Isso aqui é um componente, que vai ser gerado quando for chamado um botão mostrar treinos -->
    <ul v-for="workout in workouts" :key="workout.id">
      <li>
        <span>Nome: {{ workout.body_part }}</span>
      </li>
      <li>
        <span>Nível: {{ workout.avg_level }}</span>
      </li>
      <ul v-for="exercise in workout.exercise" :key="exercise">
        <li>
          <router-link
            :to="{
            name: 'Exercicio', 
            params: {id: replaceSpace(exercise), title: exercise},
            }
            "
            >{{ exercise }}</router-link
          >
        </li>
      </ul>
    </ul>
    <div>
    </div>
  </div>
</template>

<script>
import bootstrapvue from "bootstrap-vue";
import axios from "axios";
export default {
  data() {
    return {
      workouts: [],
      addUserWorkouts: [],
      userWorkouts: sessionStorage.workout.split(","),
    };
  },
  mounted() {
    this.getWorkouts();
  },
  methods: {
    async getWorkouts() {
      if (sessionStorage.workout == "undefined") {
        let workout = await axios({
          url: "http://localhost:8000/workouts/",
          method: "GET",
          headers: {
            Authorization: `Bearer ${sessionStorage.access}`,
          },
        });
        this.workouts = workout.data;
      }
    },
    replaceSpace(word) {
      word = word
        .normalize("NFD")
        .replace(/([\u0300-\u036f]|[^0-9a-zA-Z\s])/g, "");
      return word.replaceAll(" ", "-").toLowerCase();
    },
    postUserWorkout() {
      let addWorkout = this.$refs.addWorkout.value;
      this.userWorkouts.push(addWorkout);
      this.$refs.addWorkout.value = "";
    },
    deleteUserWorkout(index) {
      this.userWorkouts.splice(index, 1);
    },
    sendUserWorkout() {
      let sendWorkout = {};
      this.addUserWorkouts.forEach((wk, index) => {
        sendWorkout[index.toString()] = wk;
      });
      axios({
        method: "patch",
        url: `http://localhost:8000/auths/${sessionStorage.id.toString()}/`,
        data: {
          workout: sendWorkout,
        },
        headers: {
          Authorization: `Bearer ${sessionStorage.access}`,
        },
      })
        .then(() => {
          swal.fire({
            icon: "success",
            title: "Treinos adicionados com sucesso",
          });
        })
        .catch((e) => {
          swal.fire({
            icon: "error",
            title: `Erro: ${e}`,
          });
        });
    },
  },
  computed: {
    originalWorkout() {
      return sessionStorage.workout.split(",");
    },
  },
};
</script>