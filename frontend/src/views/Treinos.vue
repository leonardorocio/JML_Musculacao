<template>
  <body class="color-body">
    <nav
      class="navbar navbar-expand-lg navbar-light"
      style="background-color: black"
    >
      <img
        src="../assets/logo.png"
        alt="Background"
        height="100px"
        width="100px"
        id="imageLogo"
      />

      <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <router-link class="nav-link text-white" :to="{ name: 'Home' }"
              >Início</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link text-white" :to="{ name: 'Home' }"
              >Calistenia</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link text-white" :to="{ name: 'Articles' }"
              >Artigos</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link text-white" :to="{ name: 'About' }"
              >Contato</router-link
            >
          </li>
        </ul>
        <ul class="list-inline my-2 my-lg-0" id="auth" v-if="user_logged">
          <li class="list-inline-item">
            <button
              id="botaoInscricao"
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
            >
              <router-link :to="{ name: 'Dashboard' }" id="auth-link">
                Meu Perfil
              </router-link>
            </button>
          </li>
          <li class="list-inline-item">
            <button
              id="botaoInscricao"
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
              @click="logout()"
            >
              <a id="auth-link"> Sair </a>
            </button>
          </li>
        </ul>
        <ul class="list-inline my-2 my-lg-0" id="auth" v-else>
          <li class="list-inline-item">
            <button
              id="botaoInscricao"
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
            >
              <router-link :to="{ name: 'Cadastro' }" id="auth-link">
                Inscrição
              </router-link>
            </button>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid d-flex justify-content-center mt-3">
      <p class="display-4">Seus Treinos</p>
    </div>

    <div class="container-fluid w-75 articles-block mt-3 d-flex flex-column">
      <h5 class="card-title mb-4">Adicione treinos ao seu perfil para melhorar sua organização!<br>
        Para adicionar um treino, basta colocar o nome dele na caixa de seleção
        abaixo e confirmar com o botão:
      </h5>
      <input
        type="text"
        v-model="wk"
        list="data-workout"
        placeholder="Digite aqui"
        ref="addWorkout"
      />
      <datalist class="form-group" id="data-workout">
        <option v-for="wk in workouts" :key="wk.body_part">
          {{ wk.body_part }}
        </option>
      </datalist>
      <button class="btn btn-primary mt-3 p-2" type="submit" style="width: 12%;" @click="postUserWorkout()">Adicionar</button>
      <span class="font-weight-bold mt-3">Sua Lista de Treinos:</span>
      <div>
        <ul class="list-group">
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
              mt-3
            "
          >
            Braços
            <button class="btn btn-danger ml-5 btn-delete pl-3 pr-3 pt-2 pb-2">
              Excluir
            </button>
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
              mt-3
            "
          >
            Peitoral
            <button class="btn btn-danger ml-5 btn-delete pl-3 pr-3 pt-2 pb-2">
              Excluir
            </button>
          </li>
          <li
            class="
              list-group-item
              d-flex
              justify-content-between
              align-items-center
              mt-3
            "
          >
            Pernas
            <button class="btn btn-danger ml-5 btn-delete pl-3 pr-3 pt-2 pb-2">
              Excluir
            </button>
          </li>
        </ul>
        <button class="btn btn-primary mt-3 mb-3 p-2" type="submit" style="width: 12%;" @click="postUserWorkout()">Salvar</button>
      </div>
    </div>

    <!-- <div>
    <div v-if="userWorkouts.length < 3 && userWorkouts">
      <p>Adicione treinos ao seu perfil para melhorar sua organização!</p>
      <p>Para adicionar um treino, basta colocar o nome dele na caixa de seleção abaixo e confirmar com o botao</p>
      <input type="text" v-model="wk" list="data-workout" placeholder="Digite o nome exato de um algum dos treinos" ref="addWorkout">
      <datalist id="data-workout">
        <option v-for="wk in workouts" :key="wk.body_part">{{wk.body_part}}</option>
      </datalist>
      <button type="submit" @click="postUserWorkout()">Adicionar</button>
    </div>
    <div>
      <ul v-for="(wk, index) of userWorkouts" :key="index" class='list-group mr-5 ml-5'>
        <li class="list-group-item d-flex justify-content-between align-items-center mt-3">
          {{ wk }}
          <button class="btn btn-danger ml-5 btn-delete pl-3 pr-3 pt-2 pb-2" @click="deleteUserWorkout(index)">Excluir</button>
        </li>
      </ul>
      <button type="submit" @click="sendUserWorkout()" v-if="addUserWorkouts.length >= 3">Confirmar</button>
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
    <br /> -->

    <div class="container-fluid d-flex justify-content-center mt-3">
      <p class="display-4">Treinos</p>
    </div>

    <div class="container-fluid w-75 articles-block mt-3 d-flex flex-column">
      <form>
        <div
          class="
            form-group
            container-fluid
            d-flex
            flex-column
            align-items-start
            wide
          "
        >
          <label for="search" class="mt-2 font-weight-bold"
            >Procure por treinos:
          </label>
          <input
            type="search"
            name="searcher"
            ref="searcher"
            class="form-control w-100"
            id="search"
            placeholder="Digite aqui"
          />
        </div>
      </form>

      <div class="container w-100 d-flex justify-content-around">
        <ul
          class="mt-4 mr-5"
          v-for="workout in workouts"
          :key="workout.id"
          id="workout-list"
        >
          <div
            class="card w-100 d-flex flex-column justify-content-center"
            id="article-text"
          >
            <img class="card-img-top" :src="imageDescription(workout.id - 1)" />

            <div class="card-body">
              <div class="card-text">
                <li>
                  <h5 class="card-title p-0 m-0">
                    Treino: {{ workout.body_part }}
                  </h5>
                </li>
                <li>
                  <p>Nível: {{ workout.avg_level }}</p>
                </li>
                <li>
                  <button class="btn btn-primary p-2 mt-1">
                    <router-link
                      class="text-white"
                      :to="{
                        name: 'Exercicio',
                        params: { id: workout.id, title: workout.body_part },
                      }"
                    >
                      Saiba Mais
                    </router-link>
                  </button>
                </li>
                <!-- <ul v-for="exercise in workout.exercise" :key="exercise">
                <li>
                  <router-link
                    id="workout-exercises"
                    :to="{
                      name: 'Exercicio',
                      params: { id: replaceSpace(exercise), title: exercise },
                    }"
                    >{{ exercise }}</router-link
                  >
                </li>
              </ul> -->
              </div>
            </div>
          </div>
        </ul>
        <!-- </div> -->
      </div>

      <b-pagination
        class="d-flex justify-content-center align-items-end mt-5"
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="articleImg"
      ></b-pagination>
    </div>

    <div class="container-fluid mt-5 p-0 bg-dark d-flex justify-content-center">
      <span class="text-white">Copyright © 2021 - JML Musculação</span>
    </div>
  </body>
</template>

<script>
import bootstrapvue from "bootstrap-vue";
import axios from "axios";
export default {
  data() {
    return {
      user_logged: true,
      wk: "",
      workouts: [],
      addUserWorkouts: [],
      userWorkouts: sessionStorage.workout.split(","),
      perPage: 3,
      currentPage: 1,
    };
  },
  created() {
    this.getWorkouts();
  },
  methods: {
    async getWorkouts() {
      let workout = await axios({
        url: "http://localhost:8000/workouts/",
        method: "GET",
        headers: {
          Authorization: `Bearer ${sessionStorage.access}`,
        },
      });
      this.workouts = workout.data;
      console.log(this.workouts);
      console.log(this.workouts.descricao);
    },
    replaceSpace(word) {
      word = word
        .normalize("NFD")
        .replace(/([\u0300-\u036f]|[^0-9a-zA-Z\s])/g, "");
      return word.replaceAll(" ", "-").toLowerCase();
    },
    postUserWorkout() {
      let addWorkout = this.$refs.addWorkout.value;
      this.addUserWorkouts.push(addWorkout);
      addWorkout = "";
    },
    deleteUserWorkout(index) {
      this.userWorkouts.splice(index, 1);
    },
    imageDescription(index) {
      var image_link = this.workouts[index].descricao.split("firebase");
      return "https://firebase" + image_link[1];
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
    rows() {
      return this.workouts.length;
    },
  },
};
</script>