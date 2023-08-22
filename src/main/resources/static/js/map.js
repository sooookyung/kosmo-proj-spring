const mapOptions = {
  center: new naver.maps.LatLng(36.6549556, 127.9704944),
  zoom: 8,
};

const map = new naver.maps.Map("map", mapOptions);

const geocodeHandler = function (status, response) {
  if (status === naver.maps.Service.Status.ERROR) {
    alert("Something Wrong!");
    return;
  }

  if (response.v2.meta.totalCount === 0) {
    alert("totalCount" + response.v2.meta.totalCount);
    return;
  }

  const item = response.v2.addresses[0];
  const position = new naver.maps.LatLng(item.y, item.x);
  const marker = new naver.maps.Marker({ position, map });
  console.log(marker.getPosition());
};

for (const row of document.querySelector("#diner-data").children) {
  const divs = row.children;
  const seq = divs[0].textContent;
  const category = divs[1].textContent;
  const name = divs[2].textContent;
  const location = divs[3].textContent;
  naver.maps.Service.geocode({ query: location }, function (status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      alert("Something Wrong!");
      return;
    }

    if (response.v2.meta.totalCount === 0) {
      alert("totalCount" + response.v2.meta.totalCount);
      return;
    }

    const item = response.v2.addresses[0];
    const position = new naver.maps.LatLng(item.y, item.x);
    const marker = new naver.maps.Marker({
      position,
      map,
      title: name,
      animation: naver.maps.Animation.DROP,
    });
    naver.maps.Event.addListener(marker, "click", () => {
      new naver.maps.InfoWindow({
        content: `<h3><a target="_blank" href="/diner/detail.do?seq=${seq}" onClick="window.open(this.href, '', 'width=700, height=200, left=610, top=300'); return false;">${name}</a></h3>
        <div>카테고리: ${category}</div>
        <div>주소: ${location}</div>`,
      }).open(map, marker);
    });
  });
}

window.navermap_authFailure = function () {
  alert("지도 로딩 실패");
};
