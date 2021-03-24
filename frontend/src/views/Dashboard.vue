<template>
  <body id="fundoCadastro">
    <div
      class="container bg-white profiles d-flex flex-column justify-content-around"
    >
      <h2 class="display-4 text-center" id="meuPerfil">Meu Perfil</h2>

      <div class="container-fluid d-flex align-items-center flex-column">
        <img
          :src="profileImage"
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
            @input="onSelectFile"
          />
        </div>
      </div>

      <form action="" class="mb-3">
        <div class="form-group row mb-2">
          <label for="firstName" class="col-sm-2">Nome:</label>
          <div class="col-sm-10">
            <input
              placeholder="Luís"
              type="text"
              class="form-control form-control-sm"
              id="firstName"
              :value="first_name"
            />
          </div>
        </div>
        <div class="form-group row mb-2">
          <label for="lastName" class="col-sm-2">Sobrenome:</label>
          <div class="col-sm-10">
            <input
              placeholder="Ex: Henrique"
              type="text"
              class="form-control form-control-sm"
              id="lastName"
              :value="last_name"
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
              :value="weight"
            />
          </div>
        </div>
        <div class="form-check form-check-inline">
          <label class="form-check-label mr-5" for="">Sexo Biológico: </label>
          <input
            class="form-check-input ml-5"
            type="radio"
            name="sexRadio"
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
            name="sexRadio"
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
  </body>
</template>

<script>
import axios from "axios";

const firebase = require("../components/app.js");

export default {
  data() {
    return {
      owner_id: sessionStorage.id,
      first_name: "",
      last_name: "",
      age: null,
      height: null,
      weight: null,
      biosex: "",
      saveMethod: "",
      token: sessionStorage.access,
      profileId: null,
      profileImage: require("../assets/icone_rosto.png"),
      toUploadImage: "",
    };
  },
  mounted() {
    this.getProfileId();
    setTimeout(() => {
      this.getUserProfile();
    }, 100);
  },

  methods: {
    uploadToProfile() {
      const facePath = document.getElementById("faceInput").files[0];
      if (facePath != undefined) {
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
        return null;
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
          this.$emit("input", e.target.result);
          this.profileImage = e.target.result;
        };

        reader.readAsDataURL(files[0]);
      }
    },
    getProfileId() {
      axios({
        method: "POST",
        url: "http://localhost:8000/profiles/get_profile_id/",
        data: {
          owner_id: parseInt(this.owner_id),
        },
        headers: {
          Authorization: "Bearer " + this.token,
        },
      })
        .then((resp) => {
          this.profileId = resp.data;
        })
        .catch((error) => {
          swal.fire({
            icon: "error",
            title: "Não foi possível achar o identificador do perfil",
          });
        });
    },

    getUserProfile() {
      setTimeout(() => {
        axios({
          method: "GET",
          url: `http://localhost:8000/profiles/${parseInt(this.profileId)}/`,
          headers: {
            Authorization: "Bearer " + this.token,
          },
        })
          .then((response) => {
            let resp = response.data;
            if (
              resp.first_name ||
              resp.last_name ||
              resp.age ||
              resp.height ||
              resp.weight ||
              resp.biosex ||
              resp.image
            ) {
              this.first_name = resp.first_name;
              this.last_name = resp.last_name;
              this.age = resp.age;
              this.height = resp.height;
              this.weight = resp.weight;
              this.biosex = resp.biosex;
              this.profileImage = resp.image;
              this.saveMethod = "PUT";
            } else {
              this.saveMethod = "POST";
            }
          })
          .catch((error) => {
            if (error.response.status == 404) {
              console.log("Esse ainda não tem informações");
            } else {
              swal.fire({
                icon: "error",
                title: `Erro: ${error}`,
              });
            }
            this.saveMethod = "POST";
          });
      }, 5);
    },

    saveProfile(filepath) {
      this.first_name = document.getElementById("firstName").value;
      this.last_name = document.getElementById("lastName").value;
      this.age = document.getElementById("age").value;
      this.height = document.getElementById("height").value;
      this.weight = document.getElementById("weight").value;
      let manRadio = document.getElementById("sexMasculino");
      let womanRadio = document.getElementById("sexFeminino");
      this.biosex = manRadio.checked ? manRadio.value : womanRadio.value;

      if (this.saveMethod == "POST") {
        axios({
          method: "POST",
          url: "http://localhost:8000/profiles/",
          headers: {
            Authorization: "Bearer " + this.token,
          },
          data: {
            owner_id: parseInt(this.owner_id),
            first_name: this.first_name,
            last_name: this.last_name,
            age: this.age,
            height: this.height,
            weight: this.weight,
            biosex: this.biosex,
            image: filepath,
          },
        })
          .then((response) => {
            swal
              .fire({
                icon: "success",
                title: `Usuário cadastrado com sucesso`,
              })
              .then((result) => {
                window.location.reload();
              });
          })
          .catch((error) => {
            swal.fire({
              icon: "error",
              title: `Não foi possível cadastrar usuário. Erro: ${error}`,
            });
          });
      } else {
        axios({
          method: "PUT",
          url: `http://localhost:8000/profiles/${parseInt(this.profileId)}/`,
          headers: {
            Authorization: "Bearer " + this.token,
          },
          data: {
            owner_id: this.owner_id,
            first_name: this.first_name,
            last_name: this.last_name,
            age: this.age,
            height: this.height,
            weight: this.weight,
            biosex: this.biosex,
            image: filepath,
          },
        })
          .then((response) => {
            swal
              .fire({
                icon: "success",
                title: `Usuário atualizado com sucesso`,
              })
              .then((result) => {
                window.location.reload();
              });
          })
          .catch((errors) => {
            console.log(errors.request);
            console.log(errors.response);
            swal.fire({
              icon: "error",
              title: `Não foi possível atualizar usuário. Erro: ${errors}`,
            });
          });
      }
    },
  },
};
</script>


<style>
</style>