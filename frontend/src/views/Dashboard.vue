<template>
  <body class="color-body">
    <nav
      class="navbar navbar-expand-lg navbar-light navs"
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
    <div
      class="
        container
        bg-white
        profiles
        d-flex
        flex-column
        justify-content-around
      "
    >
      <h2 class="display-4 text-center" id="meuPerfil">Meu Perfil</h2>

      <form action="" id="profileForm" ref="profileForm">
        <div class="container-fluid d-flex align-items-center flex-column">
          <img
            :src="image"
            alt="Icone Rosto"
            id="faceIcon"
            @click="chooseImage"
          />
          <img src="" id="toUpload" style="display: none" alt="" />
          <div class="form-group d-flex align-items-center flex-column">
            <label for="faceInput" class="" id="userInfo">Perfil</label>
            <input
              type="file"
              ref="fileInput"
              class="form-control-file form-control-sm"
              id="faceInput"
              name="faceInput"
              @input="onSelectFile"
            />
          </div>
        </div>

        <div class="form-group row mb-2">
          <label for="age" class="col-sm-2">Idade:</label>
          <div class="col-sm-10">
            <input
              placeholder="Ex: 25"
              type="text"
              class="form-control form-control-sm"
              id="age"
              name="age"
              :value="age"
            />
          </div>
        </div>
        <div class="form-group row mb-2">
          <label for="altura" class="col-sm-2">Altura (em Metros):</label>
          <div class="col-sm-10">
            <input
              placeholder="Ex: 1.70"
              type="text"
              class="form-control form-control-sm"
              id="height"
              name="height"
              :value="height"
            />
          </div>
        </div>
        <div class="form-group row mb-2">
          <label for="peso" class="col-sm-2">Peso (em KG):</label>
          <div class="col-sm-10">
            <input
              placeholder="Ex: 65.5"
              type="text"
              class="form-control form-control-sm"
              id="weight"
              name="weight"
              :value="weight"
            />
          </div>
        </div>
        <div class="form-check form-check-inline">
          <label class="form-check-label mr-5" for="">Sexo Biológico: </label>
          <input
            class="form-check-input ml-5"
            type="radio"
            name="biosex"
            id="sexFeminino"
            value="F"
            :checked="biosex == 'F' ? true : false"
          />
          <label class="form-check-label" for="sexFeminino">Feminino</label>
        </div>
        <div class="form-check form-check-inline">
          <input
            class="form-check-input"
            type="radio"
            name="biosex"
            id="sexMasculino"
            value="M"
            :checked="biosex == 'M' ? true : false"
          />
          <label class="form-check-label" for="sexMasculino">Masculino</label>
        </div>
      </form>
      <button
        type="button"
        class="btn btn-primary wid p-2 mb-1"
        @click="uploadToProfile()"
      >
        Salvar Perfil
      </button>
    </div>

    <div class="container-fluid mt-5 p-0 bg-dark d-flex justify-content-center">
      <span class="text-white">Copyright © 2021 - JML Musculação</span>
    </div>
  </body>
</template>

<script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-storage.js"></script>


<script>
import axios from "axios";
import {ref} from 'firebase/storage';
const errorLog = require("../components/backend_errors.js");
const firebase = require('../components/app.js');

export default {
  data() {
    return {
      user_logged: true,
      owner_id: sessionStorage.id,
      age: undefined,
      height: undefined,
      weight: undefined,
      biosex: "",
      token: sessionStorage.access,
      image: require("../assets/icone_rosto.png"),
    };
  },
  async created() {
    // this.initFirebase();
    this.getUserProfile();
  },

  methods: {
    // initFirebase() {
    //   var firebaseConfig = {
    //       apiKey: "AIzaSyDLmRU7KMoZsByDYCLmrTqCG3wrePa8TnU",
    //       authDomain: "jml-musculacao.firebaseapp.com",
    //       databaseURL: "https://jml-musculacao.firebaseio.com",
    //       projectId: "jml-musculacao",
    //       storageBucket: "gs://jml-musculacao.appspot.com",
    //       messagingSenderId: "942758114362",
    //       appId: "1:942758114362:web:77638d14e485d678a3b103"
    //   };
    //   // Initialize Firebase
    //   firebase.initializeApp(firebaseConfig);
    // },

    uploadToProfile() {
      const facePath = document.getElementById("faceInput").files[0];
      if (facePath != undefined) {
        // const storRef = firebase.storage().ref()
        const imagesRef = firebase.storRef.child("images/" + facePath.name);
        const uploader = this;

        imagesRef
          .put(facePath)
          .then((snapshot) => {
            firebase.storRef
              .child(imagesRef.fullPath)
              .getDownloadURL()
              .then((url) => {
                uploader.saveProfile(url);
              });
          })
          .catch(function (error) {
            swal.fire({
              icon: "error",
              title: "Erro não foi possível salvar a imagem.",
            });
          });
      } else {
        this.saveProfile(null);
      }
    },

    chooseImage() {
      this.$refs.fileInput.click();
    },

    onSelectFile() {
      const input = this.$refs.fileInput;
      const files = input.files;
      if (files && files[0]) {
        const reader = new FileReader();

        reader.onload = (e) => {
          this.$emit('image', e.target.result)
          this.image = e.target.result;
        };

        reader.readAsDataURL(files[0]);
      }
    },

    async getUserProfile() {
      try {
        let response = await axios({
          method: "GET",
          url: `http://localhost:8000/profiles/${parseInt(this.owner_id)}/`,
          headers: {
            Authorization: `Bearer ${this.token}`,
          },
        });
        let resp = response.data;
        const obj = this
        for (let dt in resp) {
          if (
            dt != "owner_id" &&
            dt != 'token'
          ) {
            obj.$data[dt] = resp[dt];
          }
        }
      } catch (e) {
        errorLog.errorHandle(e)
      }
    },

    async saveProfile(filepath) {
      const form = this.$refs.profileForm;
      var formData = new FormData(form);
      if (filepath != null) { formData.append('image', filepath) }
      try {
        let response = await axios({
          method: "PATCH",
          url: `http://localhost:8000/profiles/${parseInt(this.owner_id)}/`,
          headers: {
            Authorization: "Bearer " + this.token,
          },
          data: formData, 
        });
        swal
          .fire({
            icon: "success",
            title: `Usuário atualizado com sucesso`,
          })
          .then((result) => {
            window.location.reload();
          });
      } catch (e) {
        errorLog.errorHandle(e);
      }
    },
  },
};
</script>

<style></style>
