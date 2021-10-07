function errorHandle(e) {
  var errorCode = "";
  for (let err in e.response.data) {
    errorCode += e.response.data[err];
  }
  errorCode = errorCode.split('.')[0] + '.'
  swal.fire({
    icon: "error",
    title: `Erro: ${errorCode}`,
  })
}

export {
    errorHandle
    
}